#include "enclave/oblivious_compact.h"
#include <errno.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <threads.h>
#include <liboblivious/primitives.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/error.h"
#include "common/util.h"
#include "enclave/mpi_tls.h"
#include "enclave/parallel_enc.h"
#include "enclave/threading.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

struct oblivious_compact_inner_2power_parallel_args {
    ojoin_int_type *buf;
    ojoin_int_type length;
    ojoin_int_type block_size;
    ojoin_int_type offset;
    bool *selected;
    ojoin_int_type *selected_count;
    ojoin_int_type nthreads;
};

struct oswap_range_args {
    ojoin_int_type block_size;
    ojoin_int_type swap_start, swap_end;
    ojoin_int_type offset_m1_mod;
    ojoin_int_type *buf1, *buf2;
    bool swap_flag;
};

struct oblivious_compact_inner_2power_parallel_args_elem {
    elem_t *buf;
    ojoin_int_type length;
    ojoin_int_type block_size;
    ojoin_int_type offset;
    bool *selected;
    ojoin_int_type *selected_count;
    ojoin_int_type nthreads;
};

struct oswap_range_args_elem {
    ojoin_int_type block_size;
    ojoin_int_type swap_start, swap_end;
    ojoin_int_type offset_m1_mod;
    elem_t *buf1, *buf2;
    bool swap_flag;
};

void oswap_range(void *voidargs) {
    struct oswap_range_args *args = (struct oswap_range_args*)voidargs;
    ojoin_int_type block_size = args->block_size;
    ojoin_int_type swap_start = args->swap_start;
    ojoin_int_type swap_end = args->swap_end;
    ojoin_int_type offset_m1_mod = args->offset_m1_mod;
    ojoin_int_type *buf1 = args->buf1 + swap_start*block_size;
    ojoin_int_type *buf2 = args->buf2 + swap_start*block_size;
    bool swap_flag = args->swap_flag;
    
    //FOAV_SAFE_CNTXT(oswap_range, &OSWAP_COUNTER)
    //printf("start oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    for(ojoin_int_type i=swap_start; i<swap_end; i++){
      o_memswap(buf1, buf2, sizeof(*buf1), swap_flag ^ (i >= offset_m1_mod));
      buf1+=block_size;
      buf2+=block_size;
    }
    
    //printf("end oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    return;
}

void oblivious_compact_2power_inner(ojoin_int_type *buf, ojoin_int_type N, ojoin_int_type block_size, ojoin_int_type offset, bool *selected, ojoin_int_type *selected_count) {

  if (N==1) {
    return;
  }
  if (N==2) {
    bool swap = (!selected[0] & selected[1]) ^ offset;
    o_memswap(buf, buf+block_size, sizeof(*buf), swap);
    return;
  }

  // Number of selected items in left half
  ojoin_int_type m1;
  if (true) {
    m1 = selected_count[N/2] - selected_count[0];
  } else {
    m1=0;
    for(ojoin_int_type i=0; i<N/2; i++){
      m1+=selected[i];
    }
  }

  ojoin_int_type offset_mod = (offset & ((N/2)-1));
  ojoin_int_type offset_m1_mod = (offset+m1) & ((N/2)-1);
  bool offset_right = (offset >= N/2);
  bool left_wrapped = ((offset_mod + m1) >= (N/2));

  oblivious_compact_2power_inner(buf, N/2, block_size, offset_mod, selected, selected_count);
  oblivious_compact_2power_inner(buf + ((N/2)*block_size), N/2, block_size, offset_m1_mod, (selected + (N/2)), selected_count + N/2);

  ojoin_int_type *buf1_ptr = buf, *buf2_ptr = (buf + (N/2)*block_size);
  if (true) {
    bool swap_flag = left_wrapped ^ offset_right;
    ojoin_int_type num_swap = N/2;
    for(ojoin_int_type i=0; i<num_swap; i++){
      swap_flag = swap_flag ^ (i == offset_m1_mod);
      o_memswap(buf1_ptr, buf2_ptr, sizeof(*buf1_ptr), swap_flag);
      buf1_ptr+=block_size;
      buf2_ptr+=block_size;
    }
  } else {
    for(ojoin_int_type i=0; i<N/2; i++){
      bool swap_flag = (i>=offset_m1_mod) ^ left_wrapped ^ offset_right;
      o_memswap(buf1_ptr, buf2_ptr, sizeof(*buf1_ptr), swap_flag);
      buf1_ptr+=block_size;
      buf2_ptr+=block_size;
    }
  }
}

void oblivious_compact_inner(ojoin_int_type *buf, ojoin_int_type N, ojoin_int_type block_size, bool *selected, ojoin_int_type *selected_count) {
  if (N==0) {
    return ;
  }
  else if (N==1) {
    return ;
  }
  else if (N==2) {
    bool swap = (!selected[0] & selected[1]);
    o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
    return;
  }

  ojoin_int_type gt_pow2;
  ojoin_int_type split_index;

  // Find largest power of 2 < N 
  gt_pow2 = pow2_lt(N);

  // For Order-preserving ORCompact
  // This will be right (R) of the recursion, and the leftover non-power of 2 left (L)
  split_index = N - gt_pow2;

  // Number of selected items in the non-power of 2 side (left)
  ojoin_int_type mL;
  // if (TC_PRECOMPUTE_COUNTS) {
  if (true) {
    mL = selected_count[split_index] - selected_count[0];
  } else {
    mL = 0;
    for(ojoin_int_type i=0; i<split_index; i++){
      mL+=selected[i];
    }
  }

  ojoin_int_type *L_ptr = buf;
  ojoin_int_type *R_ptr = buf + (split_index * block_size);

  //printf("Lsize = %ld, Rsize = %ld, Rside offset = %ld\n", split_index, gt_pow2, (gt_pow2 - split_index + mL));
  oblivious_compact_inner(L_ptr, split_index, block_size, selected, selected_count);
  oblivious_compact_2power_inner(R_ptr, gt_pow2, block_size, (gt_pow2 - split_index + mL) % gt_pow2, selected+split_index, selected_count+split_index);

  // For OP we CnS the first n_2 elements (split_size) against the suffix n_2 elements of the n_1 (2 power elements)
  R_ptr = buf + (gt_pow2 * block_size); 

  // Perform N-split_index oblivious swaps for this level
  for (ojoin_int_type i=0; i<split_index; i++){
    // Oswap blocks at L_start, R_start conditional on marked_items
    bool swap_flag = i>=mL;
    o_memswap(L_ptr, R_ptr, sizeof(*L_ptr), swap_flag);
    L_ptr+=block_size;
    R_ptr+=block_size;
  }
}

void oblivious_compact_inner_2power_parallel(void *args_) {
  struct oblivious_compact_inner_2power_parallel_args *args0 = (struct oblivious_compact_inner_2power_parallel_args*)args_;
  ojoin_int_type *buf = args0->buf;
  ojoin_int_type N = args0->length;
  ojoin_int_type block_size = args0->block_size;
  ojoin_int_type offset = args0->offset;
  bool *selected = args0->selected;
  ojoin_int_type *selected_count = args0->selected_count;
  ojoin_int_type nthreads = args0->nthreads;

  if (nthreads <= 1) {
    oblivious_compact_2power_inner(buf, N, block_size, offset, selected, selected_count);
    return;
  }
  if (N==1) {
    return;
  }
  if (N==2) {
    bool swap = (!selected[0] & selected[1]) ^ offset;
    o_memswap(buf, buf+block_size, sizeof(*buf), swap);
    return;
  }

  // Number of selected items in left half
  ojoin_int_type m1;
  m1 = selected_count[N/2] - selected_count[0];

  ojoin_int_type offset_mod = (offset & ((N/2)-1));
  ojoin_int_type offset_m1_mod = (offset+m1) & ((N/2)-1);
  bool offset_right = (offset >= N/2);
  bool left_wrapped = ((offset_mod + m1) >= (N/2));
  ojoin_int_type lthreads = nthreads/2;
  ojoin_int_type rthreads = nthreads - lthreads;

  /* Dispatch the right half to thread g_thread_id + lthreads; it will inherit threads
     g_thread_id + lthreads .. g_thread_id + nthreads-1. */
      
  struct oblivious_compact_inner_2power_parallel_args right_args = {
    buf+ ((N/2)*block_size), N/2, block_size, offset_m1_mod, selected + N/2, selected_count + N/2, rthreads
  };

  struct oblivious_compact_inner_2power_parallel_args left_args = {
    buf, N/2, block_size, offset_mod, selected, selected_count, lthreads    
  };

  struct thread_work right_work = {
    .type = THREAD_WORK_SINGLE,
    .single = {
      .func = oblivious_compact_inner_2power_parallel,
      .arg = &right_args,
      }
  };

  thread_work_push(&right_work);
  oblivious_compact_inner_2power_parallel(&left_args);
  thread_wait(&right_work);

  ojoin_int_type *buf1_ptr = buf, *buf2_ptr = (buf + (N/2)*block_size);
  bool swap_flag = left_wrapped ^ offset_right;
  ojoin_int_type num_swap = N/2;

  struct oswap_range_args args[nthreads];
  struct thread_work multi_work[nthreads];
  ojoin_int_type inc = num_swap / nthreads;
  ojoin_int_type extra = num_swap % nthreads;
  ojoin_int_type last = 0;
  for (ojoin_int_type i=0; i<nthreads; ++i) {
    ojoin_int_type next = last + inc + (i < extra);

    args[i].block_size = block_size;
    args[i].swap_start = last;
    args[i].swap_end = next;
    args[i].offset_m1_mod = offset_m1_mod;
    args[i].buf1 = buf1_ptr;
    args[i].buf2 = buf2_ptr;
    args[i].swap_flag = swap_flag;

    last = next;
  }
  for (ojoin_int_type i=0; i<nthreads-1; ++i) {
    multi_work[i].type = THREAD_WORK_SINGLE;
    multi_work[i].single.func = oswap_range;
    multi_work[i].single.arg = &args[i];
    thread_work_push(&multi_work[i]);
  }
  // Do the last section ourselves
  oswap_range((void*)(args+nthreads-1));
  for (ojoin_int_type i=0; i<nthreads-1; ++i) {
    thread_wait(&multi_work[i]);
  }
}


void oblivious_compact_inner_parallel(ojoin_int_type *buf, ojoin_int_type N, ojoin_int_type block_size, bool *selected, ojoin_int_type *selected_count, ojoin_int_type nthreads) {
  
    if (nthreads <= 1 || N < 16) {
      oblivious_compact_inner(buf, N, block_size, selected, selected_count);
      return;
    }
    if(N==0){
      return;
    }
    else if(N==1){
      return;
    }
    else if(N==2){
      bool swap = (!selected[0] & selected[1]);
      o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
      return;
    }

    //ojoin_int_type split_index, n1, n2;
    ojoin_int_type n1, n2;

    // Find largest power of 2 < N
    // This will be right (R) n1 of the recursion, and the leftover left (L) n2
    n1 = pow2_lt(N);
    n2 = N - n1;

    // Number of selected items in left
    ojoin_int_type m2;
    m2 = selected_count[n2] - selected_count[0];

    ojoin_int_type *L_ptr = buf;
    ojoin_int_type *R_ptr = buf + (n2 * block_size);

    ojoin_int_type rthreads = nthreads * n1 / N;
    ojoin_int_type lthreads = nthreads - rthreads;

    struct oblivious_compact_inner_2power_parallel_args right_args = {
        R_ptr, n1, block_size, n1 - n2 + m2, selected + n2, selected_count + n2,
        rthreads
    };
    //struct oblivious_compact_inner_parallel_args left_args = {
    //    L_ptr, n2, block_size, selected, selected_count, lthreads
    //};
  
    struct thread_work right_work = {
        .type = THREAD_WORK_SINGLE,
        .single = {
            .func = oblivious_compact_inner_2power_parallel,
            .arg = &right_args,
        },
    };
    thread_work_push(&right_work);
    oblivious_compact_inner_parallel(L_ptr, n2, block_size, selected, selected_count, lthreads);
    thread_wait(&right_work);

    ojoin_int_type num_swap = N-n1;
    struct oswap_range_args args[nthreads];
    ojoin_int_type inc = num_swap / nthreads;
    ojoin_int_type extra = num_swap % nthreads;
    ojoin_int_type last = 0;

    // We tweak R_ptr before we compare, to set compare the n2 prefix in L with the n2 suffix of R
    R_ptr = buf + (n1 * block_size);

    for (ojoin_int_type i=0; i<nthreads; ++i) {
        ojoin_int_type next = last + inc + (i < extra);
        
        args[i].block_size = block_size;
        args[i].swap_start = last;
        args[i].swap_end = next;
        args[i].offset_m1_mod = m2;
        args[i].buf1 = L_ptr;
        args[i].buf2 = R_ptr;
        args[i].swap_flag = false;

        last = next;
    }
    // do in parallel!
    struct thread_work multi_work[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work[i].type = THREAD_WORK_SINGLE;
        multi_work[i].single.func = oswap_range;
        multi_work[i].single.arg = &args[i];
        thread_work_push(&multi_work[i]);
    }
    
    // Do the last section ourselves
    oswap_range((void*)(args+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work[i]);
    }
    /*
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        threadpool_join(g_thread_id+1+i, NULL);
    }???????????????????????
    */

    //printf_with_rtclock_diff(start, "Thread %u ending TightCompact_inner_parallel(N=%lu, nthreads=%lu)\n", g_thread_id, N, nthreads);
}

void oblivious_compact(ojoin_int_type *buf, bool *selected, ojoin_int_type length, ojoin_int_type block_size, ojoin_int_type number_threads) {
    
    ojoin_int_type *selected_count = NULL;
    selected_count = calloc((length+1), sizeof(*selected_count));
    selected_count[0] = 0;

    // Compute cumulative counts
    for (ojoin_int_type i = 0; i < length; i++){
        selected_count[i + 1] = selected[i] + selected_count[i];
    }
    //printf("TightCompact_parallel(nthreads=%lu)\n", nthreads);

    oblivious_compact_inner_parallel(buf, length, block_size, selected, selected_count, number_threads);

}










//pending


void oswap_range_elem(void *voidargs) {
    struct oswap_range_args_elem *args = voidargs;
    ojoin_int_type block_size = args->block_size;
    ojoin_int_type swap_start = args->swap_start;
    ojoin_int_type swap_end = args->swap_end;
    ojoin_int_type offset_m1_mod = args->offset_m1_mod;
    elem_t *buf1 = args->buf1 + swap_start*block_size;
    elem_t *buf2 = args->buf2 + swap_start*block_size;
    bool swap_flag = args->swap_flag;
    
    //FOAV_SAFE_CNTXT(oswap_range, &OSWAP_COUNTER)
    //printf("start oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    for(ojoin_int_type i=swap_start; i<swap_end; i++){
      o_memswap(buf1, buf2, sizeof(*buf1), swap_flag ^ (i >= offset_m1_mod));
      buf1+=block_size;
      buf2+=block_size;////????????????????
    }
    
    //printf("end oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    return;
}

void oblivious_compact_2power_inner_elem(elem_t *buf, ojoin_int_type N, ojoin_int_type block_size, ojoin_int_type offset, bool *selected, ojoin_int_type *selected_count) {

  if (N==1) {
    return;
  }
  if (N==2) {
    bool swap = ((!selected[0] & selected[1]) ^ offset);
    o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
    return;
  }

  // Number of selected items in left half
  ojoin_int_type m1;
  if (true) {
    m1 = selected_count[N/2] - selected_count[0];
  } else {
    m1=0;
    for(ojoin_int_type i=0; i<N/2; i++){
      m1+=selected[i];
    }
  }

  ojoin_int_type offset_mod = (offset & ((N/2)-1));
  ojoin_int_type offset_m1_mod = (offset+m1) & ((N/2)-1);
  bool offset_right = (offset >= N/2);
  bool left_wrapped = ((offset_mod + m1) >= (N/2));

  //printf("left 2power size:%ld offset:%ld\n", N/2, offset_mod);
  oblivious_compact_2power_inner_elem(buf, N/2, block_size, offset_mod, selected, selected_count);
  //printf("right 2power size:%ld offset:%ld\n", N/2, offset_m1_mod);
  oblivious_compact_2power_inner_elem(buf + ((N/2)*block_size), N/2, block_size, offset_m1_mod, (selected + (N/2)), selected_count + N/2);

  elem_t *buf1_ptr = buf, *buf2_ptr = (buf + (N/2)*block_size);
  if (true) {
    bool swap_flag = left_wrapped ^ offset_right;
    ojoin_int_type num_swap = N/2;
    for(ojoin_int_type i=0; i<num_swap; i++){
      swap_flag = swap_flag ^ (i == offset_m1_mod);
      o_memswap(buf1_ptr, buf2_ptr, sizeof(*buf1_ptr), swap_flag);
      buf1_ptr+=block_size;
      buf2_ptr+=block_size;
    }
  } else {
    for(ojoin_int_type i=0; i<N/2; i++){
      bool swap_flag = (i>=offset_m1_mod) ^ left_wrapped ^ offset_right;
      o_memswap(buf1_ptr, buf2_ptr, sizeof(*buf1_ptr), swap_flag);
      buf1_ptr+=block_size;
      buf2_ptr+=block_size;
    }
  }
}

void oblivious_compact_inner_elem(elem_t *buf, ojoin_int_type N, ojoin_int_type block_size, bool *selected, ojoin_int_type *selected_count) {
  if (N==0) {
    return ;
  }
  else if (N==1) {
    return ;
  }
  else if (N==2) {
    bool swap = (!selected[0] & selected[1]);
    o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
    return;
  }

  ojoin_int_type gt_pow2;
  ojoin_int_type split_index;

  // Find largest power of 2 < N 
  gt_pow2 = pow2_lt(N);

  // For Order-preserving ORCompact
  // This will be right (R) of the recursion, and the leftover non-power of 2 left (L)
  split_index = N - gt_pow2;

  // Number of selected items in the non-power of 2 side (left)
  ojoin_int_type mL;
  // if (TC_PRECOMPUTE_COUNTS) {
  if (true) {
    mL = selected_count[split_index] - selected_count[0];
  } else {
    mL = 0;
    for(ojoin_int_type i=0; i<split_index; i++){
      mL+=selected[i];
    }
  }

  elem_t *L_ptr = buf;
  elem_t *R_ptr = buf + (split_index * block_size);

  //printf("inner Lsize = %ld, 2power Rsize = %ld, Rside offset = %ld\n", split_index, gt_pow2, (gt_pow2 - split_index + mL)% gt_pow2);
  oblivious_compact_inner_elem(L_ptr, split_index, block_size, selected, selected_count);
  
  oblivious_compact_2power_inner_elem(R_ptr, gt_pow2, block_size, (gt_pow2 - split_index + mL) % gt_pow2, selected+split_index, selected_count+split_index);

  // For OP we CnS the first n_2 elements (split_size) against the suffix n_2 elements of the n_1 (2 power elements)
  R_ptr = buf + (gt_pow2 * block_size); 

  // Perform N-split_index oblivious swaps for this level
  for (ojoin_int_type i=0; i<split_index; i++){
    // Oswap blocks at L_start, R_start conditional on marked_items
    bool swap_flag = i>=mL;
    o_memswap(L_ptr, R_ptr, sizeof(*L_ptr), swap_flag);
    L_ptr+=block_size;
    R_ptr+=block_size;
  }
}

void oblivious_compact_inner_2power_parallel_elem(void *args_) {
  struct oblivious_compact_inner_2power_parallel_args_elem *args0 = args_;
  elem_t *buf = args0->buf;
  ojoin_int_type N = args0->length;
  ojoin_int_type block_size = args0->block_size;
  ojoin_int_type offset = args0->offset;
  bool *selected = args0->selected;
  ojoin_int_type *selected_count = args0->selected_count;
  ojoin_int_type nthreads = args0->nthreads;

  if (nthreads <= 1) {
    oblivious_compact_2power_inner_elem(buf, N, block_size, offset, selected, selected_count);
    return;
  }
  if (N==1) {
    return;
  }
  if (N==2) {
    bool swap = (!selected[0] & selected[1]) ^ offset;
    o_memswap(buf, buf+block_size, sizeof(*buf), swap);
    return;
  }

  // Number of selected items in left half
  ojoin_int_type m1;
  m1 = selected_count[N/2] - selected_count[0];

  ojoin_int_type offset_mod = (offset & ((N/2)-1));
  ojoin_int_type offset_m1_mod = (offset+m1) & ((N/2)-1);
  bool offset_right = (offset >= N/2);
  bool left_wrapped = ((offset_mod + m1) >= (N/2));
  ojoin_int_type lthreads = nthreads/2;
  ojoin_int_type rthreads = nthreads - lthreads;

  /* Dispatch the right half to thread g_thread_id + lthreads; it will inherit threads
     g_thread_id + lthreads .. g_thread_id + nthreads-1. */
      
  struct oblivious_compact_inner_2power_parallel_args_elem right_args = {
    buf+ (N/2), N/2, block_size, offset_m1_mod, selected + N/2, selected_count + N/2, rthreads
  };
  struct oblivious_compact_inner_2power_parallel_args_elem left_args = {
    buf, N/2, block_size, offset_mod, selected, selected_count, lthreads
  };


  struct thread_work right_work = {
    .type = THREAD_WORK_SINGLE,
    .single = {
      .func = oblivious_compact_inner_2power_parallel_elem,
      .arg = &right_args,
      }
  };

  thread_work_push(&right_work);
  oblivious_compact_inner_2power_parallel_elem(&left_args);
  thread_wait(&right_work);

  elem_t *buf1_ptr = buf, *buf2_ptr = (buf + (N/2));
  bool swap_flag = left_wrapped ^ offset_right;
  ojoin_int_type num_swap = N/2;

  struct oswap_range_args_elem args[nthreads];
  struct thread_work multi_work[nthreads];
  ojoin_int_type inc = num_swap / nthreads;
  ojoin_int_type extra = num_swap % nthreads;
  ojoin_int_type last = 0;
  for (ojoin_int_type i=0; i<nthreads; ++i) {
    ojoin_int_type next = last + inc + (i < extra);

    args[i].block_size = block_size;
    args[i].swap_start = last;
    args[i].swap_end = next;
    args[i].offset_m1_mod = offset_m1_mod; // you did not mod offset??? did
    args[i].buf1 = buf1_ptr;
    args[i].buf2 = buf2_ptr;
    args[i].swap_flag = swap_flag;

    last = next;
  }
  for (ojoin_int_type i=0; i<nthreads-1; ++i) {
    multi_work[i].type = THREAD_WORK_SINGLE;
    multi_work[i].single.func = oswap_range_elem;
    multi_work[i].single.arg = &args[i];
    thread_work_push(&multi_work[i]);
  }
  // Do the last section ourselves
  oswap_range_elem((void*)(args+nthreads-1));
  for (ojoin_int_type i=0; i<nthreads-1; ++i) {
    thread_wait(&multi_work[i]);
  }
}


void oblivious_compact_inner_parallel_elem(elem_t *buf, ojoin_int_type N, ojoin_int_type block_size, bool *selected, ojoin_int_type *selected_count, ojoin_int_type nthreads) {
  
    if (nthreads <= 1 || N < 16) {
      oblivious_compact_inner_elem(buf, N, block_size, selected, selected_count);
      return;
    }
    if(N==0){
      return;
    }
    else if(N==1){
      return;
    }
    else if(N==2){
      bool swap = (!selected[0] & selected[1]);
      o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
      return;
    }

    //ojoin_int_type split_index, n1, n2;
    ojoin_int_type n1, n2;

    // Find largest power of 2 < N
    // This will be right (R) n1 of the recursion, and the leftover left (L) n2
    n1 = pow2_lt(N);
    n2 = N - n1;

    // Number of selected items in left
    ojoin_int_type m2;
    m2 = selected_count[n2] - selected_count[0];

    elem_t *L_ptr = buf;
    elem_t *R_ptr = buf + (n2 * block_size);

    ojoin_int_type rthreads = nthreads * n1 / N;
    ojoin_int_type lthreads = nthreads - rthreads;

    struct oblivious_compact_inner_2power_parallel_args_elem right_args = {
        R_ptr, n1, block_size, (n1 - n2 + m2) % n1, selected + n2, selected_count + n2,
        rthreads
    };
  
    struct thread_work right_work = {
        .type = THREAD_WORK_SINGLE,
        .single = {
            .func = oblivious_compact_inner_2power_parallel_elem,
            .arg = &right_args,
        },
    };
    thread_work_push(&right_work);
    oblivious_compact_inner_parallel_elem(L_ptr, n2, block_size, selected, selected_count, lthreads);
    thread_wait(&right_work);

    ojoin_int_type num_swap = N-n1;
    struct oswap_range_args_elem args[nthreads];
    ojoin_int_type inc = num_swap / nthreads;
    ojoin_int_type extra = num_swap % nthreads;
    ojoin_int_type last = 0;

    // We tweak R_ptr before we compare, to set compare the n2 prefix in L with the n2 suffix of R
    R_ptr = buf + n1;

    for (ojoin_int_type i=0; i<nthreads; ++i) {
        ojoin_int_type next = last + inc + (i < extra);

        args[i].block_size = block_size;
        args[i].swap_start = last;
        args[i].swap_end = next;
        args[i].offset_m1_mod = m2;
        args[i].buf1 = L_ptr;
        args[i].buf2 = R_ptr;
        args[i].swap_flag = false;

        last = next;
    }
    // do in parallel!
    struct thread_work multi_work[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work[i].type = THREAD_WORK_SINGLE;
        multi_work[i].single.func = oswap_range_elem;
        multi_work[i].single.arg = &args[i];
        thread_work_push(&multi_work[i]);
    }
    
    // Do the last section ourselves
    oswap_range_elem((void*)(args+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work[i]);
    }
    /*
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        threadpool_join(g_thread_id+1+i, NULL);
    }???????????????????????
    */

    //printf_with_rtclock_diff(start, "Thread %u ending TightCompact_inner_parallel(N=%lu, nthreads=%lu)\n", g_thread_id, N, nthreads);
}

void oblivious_compact_elem(elem_t *buf, bool *selected, ojoin_int_type length, ojoin_int_type block_size, ojoin_int_type number_threads) {
    
    ojoin_int_type *selected_count = NULL;
    selected_count = calloc((length+1), sizeof(*selected_count));
    selected_count[0] = 0;

    // Compute cumulative counts
    for (ojoin_int_type i = 0; i < length; i++){
        selected_count[i + 1] = selected[i] + selected_count[i];
    }
    //printf("TightCompact_parallel(nthreads=%lu)\n", nthreads);

    oblivious_compact_inner_parallel_elem(buf, length, block_size, selected, selected_count, number_threads);
}