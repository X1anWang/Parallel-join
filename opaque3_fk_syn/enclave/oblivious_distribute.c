#include "enclave/oblivious_distribute.h"
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



//#include "enclave/oblivious_distribute.h"

struct oblivious_distribute_inner_2power_parallel_args {
    ojoin_int_type *buf;
    ojoin_int_type *index_target;
    ojoin_int_type index_start_cur;
    ojoin_int_type offset;
    ojoin_int_type N;
    ojoin_int_type nthreads;
};

struct oswap_range2_args {
    ojoin_int_type swap_start, swap_end;
    ojoin_int_type offset_m1_mod;
    ojoin_int_type *buf1, *buf2;
    bool swap_flag;
};

struct oblivious_distribute_inner_2power_parallel_args_elem {
    elem_t *buf;
    ojoin_int_type *index_target;
    ojoin_int_type index_start_cur;
    ojoin_int_type offset;
    ojoin_int_type N;
    ojoin_int_type nthreads;
};

struct oswap_range2_args_elem {
    ojoin_int_type swap_start, swap_end;
    ojoin_int_type offset_m1_mod;
    elem_t *buf1, *buf2;
    bool swap_flag;
};

void oswap_range2(void *voidargs) {
    struct oswap_range2_args *args = (struct oswap_range2_args*)voidargs;
    ojoin_int_type swap_start = args->swap_start;
    ojoin_int_type swap_end = args->swap_end;
    ojoin_int_type offset_m1_mod = args->offset_m1_mod;
    ojoin_int_type *buf1 = args->buf1;
    ojoin_int_type *buf2 = args->buf2;
    bool swap_flag = args->swap_flag;
    
    //FOAV_SAFE_CNTXT(oswap_range2, &OSWAP_COUNTER)
    //printf("start oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    for(ojoin_int_type i=swap_start; i<swap_end; i++){
      o_memswap(&buf1[i], &buf2[i], sizeof(*buf1), swap_flag ^ (i >= offset_m1_mod));
    }
    
    //printf("end oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    return;
}

void oblivious_distribute_inner_2power(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type offset, ojoin_int_type N) {
    
    if (N == 1) {
        return ;
    }
    if (N == 2) {
        bool swap = (index_start_cur < index_target[0]) ^ offset;
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
    }

    ojoin_int_type m2 = 0;
    ojoin_int_type temp = N / 2;
    for (ojoin_int_type i = 0; i < N; i++) {
        m2 += (temp <= index_target[i]);
    };

    
    ojoin_int_type ii = (m2 - N + offset) % temp;
    ojoin_int_type *L_ptr = buf;
    ojoin_int_type *R_ptr = buf + temp;
    ojoin_int_type *L_ptr_index = index_target;
    ojoin_int_type *R_ptr_index = index_target + temp;
    for (ojoin_int_type i = 0; i < temp; i++) {
        o_memswap(&L_ptr[i], &R_ptr[i], sizeof(*buf), (ii <= i));
        o_memswap(&L_ptr_index[i], &R_ptr_index[i], sizeof(*index_target), (ii <= i));
    }

    ojoin_int_type offset_mod = offset % temp;
    ojoin_int_type offset_mod2 = (offset + m2) % temp;

    oblivious_distribute_inner_2power(buf+ temp, index_target+temp, index_start_cur+temp, offset_mod2, temp);
    oblivious_distribute_inner_2power(buf, index_target, index_start_cur, offset_mod, temp);

};

void oblivious_distribute_inner(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N) {

    if (N == 0 || N == 1) {
        return ;
    }
    else if(N == 2) {
        bool swap = (index_start_cur < index_target[0]);
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
        return;
    }

    ojoin_int_type n1, n2;

    n1 = pow2_lt(N);
    n2 = N - n1;

    // aggregation tree
    ojoin_int_type m2 = 0;
    ojoin_int_type temp = index_start_cur + n2;
    for (ojoin_int_type i = 0; i < n2; i++) {
        m2 += (temp <= index_target[i]);
    };

    for (ojoin_int_type i = 0; i < n2; i++) {
        o_memswap(&buf[i], &buf[i + n1], sizeof(*buf), (m2 <= i));
        o_memswap(&index_target[i], &index_target[i + n1], sizeof(*index_target), (m2 <= i));
    }

    ojoin_int_type *L_ptr = buf;
    ojoin_int_type *R_ptr = buf + n2;

    oblivious_distribute_inner(L_ptr, index_target, index_start_cur, n2);
    oblivious_distribute_inner_2power(R_ptr, index_target + n2, index_start_cur + n2, (n1 - n2 + m2) % n1, n2);


};

void oblivious_distribute_inner_2power_parallel(void *args_) {
    struct oblivious_distribute_inner_2power_parallel_args *args = (struct oblivious_distribute_inner_2power_parallel_args*)args_;
    ojoin_int_type *buf = args->buf;
    ojoin_int_type *index_target = args->index_target;
    ojoin_int_type index_start_cur = args->index_start_cur;
    ojoin_int_type offset = args->offset;
    ojoin_int_type N = args->N;
    ojoin_int_type nthreads = args->nthreads;

    if (N == 1) {
        return ;
    }
    if (N == 2) {
        bool swap = (index_start_cur < index_target[0]) ^ offset;
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
    }

    ojoin_int_type m2 = 0;
    ojoin_int_type temp = N / 2;
    for (ojoin_int_type i = 0; i < N; i++) {
        m2 += (temp <= index_target[i]);
    };

    /*
    ojoin_int_type ii = (m2 - N + offset) % temp;
    ojoin_int_type * L_ptr = buf;
    ojoin_int_type * R_ptr = buf + temp;
    ojoin_int_type * L_ptr_index = index_target;
    ojoin_int_type * R_ptr_index = index_target + temp;
    for (ojoin_int_type i = 0; i < temp; i++) {
        o_memswap(L_ptr + i, R_ptr + i, sizeof(*buf), (ii <= i));
        o_memswap(L_ptr + i, R_ptr + i, sizeof(*index_target), (ii <= i));
    }
    */

    struct oswap_range2_args args1[nthreads];
    struct oswap_range2_args args2[nthreads];
    ojoin_int_type inc = temp / nthreads;
    ojoin_int_type extra = temp % nthreads;
    ojoin_int_type last = 0;



    ojoin_int_type *L_ptr = buf;
    ojoin_int_type *R_ptr = buf + temp;

    ojoin_int_type *L_ptr_index = index_target;
    ojoin_int_type *R_ptr_index = index_target + temp;

    for (ojoin_int_type i=0; i<nthreads; ++i) {
        ojoin_int_type next = last + inc + (i < extra);

        args1[i].swap_start = last;
        args1[i].swap_end = next;
        args1[i].offset_m1_mod = (m2 - N + offset) % temp;
        args1[i].buf1 = L_ptr;
        args1[i].buf2 = R_ptr;
        args1[i].swap_flag = false;

        args2[i].swap_start = last;
        args2[i].swap_end = next;
        args2[i].offset_m1_mod = (m2 - N + offset) % temp;
        args2[i].buf1 = L_ptr_index;
        args2[i].buf2 = R_ptr_index;
        args2[i].swap_flag = false;

        last = next;
    }
    
    struct thread_work multi_work[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work[i].type = THREAD_WORK_SINGLE;
        multi_work[i].single.func = oswap_range2;
        multi_work[i].single.arg = &args1[i];
        thread_work_push(&multi_work[i]);
    }
    
    oswap_range2((void*)(args1+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work[i]);
    }

    struct thread_work multi_work2[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work2[i].type = THREAD_WORK_SINGLE;
        multi_work2[i].single.func = oswap_range2;
        multi_work2[i].single.arg = &args2[i];
        thread_work_push(&multi_work2[i]);
    }
    
    oswap_range2((void*)(args2+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work2[i]);
    }

    ojoin_int_type offset_mod = offset % temp;
    ojoin_int_type offset_mod2 = (offset + m2) % temp;
    ojoin_int_type lthreads = nthreads/2;
    ojoin_int_type rthreads = nthreads - lthreads;

    /* Dispatch the right half to thread g_thread_id + lthreads; it will inherit threads
        g_thread_id + lthreads .. g_thread_id + nthreads-1. */
    
    struct oblivious_distribute_inner_2power_parallel_args right_args = {
        buf+ temp, index_target+temp, index_start_cur+temp, offset_mod2, temp, rthreads
    };
    struct oblivious_distribute_inner_2power_parallel_args left_args = {
        buf, index_target, index_start_cur, offset_mod, temp, lthreads
    };


    struct thread_work right_work = {
        .type = THREAD_WORK_SINGLE,
        .single = {
        .func = oblivious_distribute_inner_2power_parallel,
        .arg = &right_args,
        }
    };

    thread_work_push(&right_work);
    oblivious_distribute_inner_2power_parallel(&left_args);
    thread_wait(&right_work);
};

void oblivious_distribute_inner_parallel(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N, ojoin_int_type nthreads) {

    if (nthreads <= 1 || N < 16) {
        oblivious_distribute_inner(buf, index_target, index_start_cur, N);
        return ;
    }
    if (N == 0 || N == 1) {
        return ;
    }
    else if(N == 2) {
        //?
        bool swap = (index_start_cur < index_target[0]);
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
        return;
    }

    ojoin_int_type n1, n2;

    n1 = pow2_lt(N);
    n2 = N - n1;

    ojoin_int_type m2 = 0;
    ojoin_int_type temp = index_start_cur + n2;
    for (ojoin_int_type i = 0; i < n2; i++) {
        m2 += (temp <= index_target[i]);
    };
    
    ojoin_int_type num_swap = n2;
    struct oswap_range2_args args[nthreads];
    struct oswap_range2_args args2[nthreads];
    ojoin_int_type inc = num_swap / nthreads;
    ojoin_int_type extra = num_swap % nthreads;
    ojoin_int_type last = 0;

    ojoin_int_type *L_ptr = buf;
    ojoin_int_type *R_ptr = buf + n1;

    ojoin_int_type *L_ptr_index = index_target;
    ojoin_int_type *R_ptr_index = index_target + n1;

    for (ojoin_int_type i=0; i<nthreads; ++i) {
        ojoin_int_type next = last + inc + (i < extra);
        
        args[i].swap_start = last;
        args[i].swap_end = next;
        args[i].offset_m1_mod = m2;
        args[i].buf1 = L_ptr;
        args[i].buf2 = R_ptr;
        args[i].swap_flag = false;

        args2[i].swap_start = last;
        args2[i].swap_end = next;
        args2[i].offset_m1_mod = m2;
        args2[i].buf1 = L_ptr_index;
        args2[i].buf2 = R_ptr_index;
        args2[i].swap_flag = false;

        last = next;
    }
    
    struct thread_work multi_work[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work[i].type = THREAD_WORK_SINGLE;
        multi_work[i].single.func = oswap_range2;
        multi_work[i].single.arg = &args[i];
        thread_work_push(&multi_work[i]);
    }
    
    oswap_range2((void*)(args+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work[i]);
    }

    struct thread_work multi_work2[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work2[i].type = THREAD_WORK_SINGLE;
        multi_work2[i].single.func = oswap_range2;
        multi_work2[i].single.arg = &args2[i];
        thread_work_push(&multi_work2[i]);
    }
    
    oswap_range2((void*)(args2+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work2[i]);
    }

    R_ptr = buf + n2;
    R_ptr_index = index_target + n2;

    ojoin_int_type lthreads = nthreads/2;
    ojoin_int_type rthreads = nthreads - lthreads;

    struct oblivious_distribute_inner_2power_parallel_args right_args = {///
        R_ptr, R_ptr_index, index_start_cur+n2, (n1 - n2 + m2) % n1, n1, rthreads
    };
  
    struct thread_work right_work = {
        .type = THREAD_WORK_SINGLE,
        .single = {
            .func = oblivious_distribute_inner_2power_parallel,
            .arg = &right_args,
        },
    };
    thread_work_push(&right_work);
    oblivious_distribute_inner_parallel(L_ptr, index_target, index_start_cur, n2, lthreads);
    thread_wait(&right_work);

}

void oblivious_distribute(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type length, ojoin_int_type number_threads) {

    oblivious_distribute_inner_parallel(buf, index_target, 0, length, number_threads);
};



















void oswap_range2_elem(void *voidargs) {
    struct oswap_range2_args_elem *args = (struct oswap_range2_args_elem*)voidargs;
    ojoin_int_type swap_start = args->swap_start;
    ojoin_int_type swap_end = args->swap_end;
    ojoin_int_type offset_m1_mod = args->offset_m1_mod;
    elem_t *buf1 = args->buf1;
    elem_t *buf2 = args->buf2;
    bool swap_flag = args->swap_flag;
    
    //FOAV_SAFE_CNTXT(oswap_range2, &OSWAP_COUNTER)
    //printf("start oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    for(ojoin_int_type i=swap_start; i<swap_end; i++){
      o_memswap(&buf1[i], &buf2[i], sizeof(*buf1), swap_flag ^ (i >= offset_m1_mod));
    }
    
    //printf("end oswap range %p %lu %lu\n", buf1, swap_start, swap_end);
    return;
}

void oblivious_distribute_inner_2power_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type offset, ojoin_int_type N) {
    
    if (N == 1 || N == 0) {
        return ;
    }

    ojoin_int_type m2 = 0;
    ojoin_int_type temp2 = N / 2;
    ojoin_int_type temp = index_start_cur + temp2;
    for (ojoin_int_type i = 0; i < N; i++) {
        m2 += (index_target[i] < temp);
    };

    if (N == 2) {
        bool swap = !(m2 ^ offset);
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
        return ;
    }

    
    //ojoin_int_type ii = (m2 - N + offset) % temp2;
    bool condition_0 = (offset < temp2);
    bool condition_1 = (((offset % temp2) + m2) < temp2);
    bool condition_2;
    bool condition_3 = condition_0 ^ condition_1;
    ojoin_int_type ii = (offset + m2) % temp2;
    /*
    elem_t *L_ptr = buf;
    elem_t *R_ptr = buf + temp;
    ojoin_int_type *L_ptr_index = index_target;
    ojoin_int_type *R_ptr_index = index_target + temp;
    */
    for (ojoin_int_type i = 0; i < temp2; i++) {
        condition_2 = condition_3 ^ (ii <= i);
        o_memswap(&buf[i], &buf[temp2 + i], sizeof(*buf), condition_2);
        o_memswap(&index_target[i], &index_target[temp2 + i], sizeof(*index_target), condition_2);
    }

    //ojoin_int_type offset_mod = offset % temp2;
    //ojoin_int_type offset_mod2 = (offset + m2) % temp2;

    oblivious_distribute_inner_2power_elem(buf+temp2, index_target+temp2, index_start_cur+temp2, ((offset + m2) % temp2), temp2); //right
    oblivious_distribute_inner_2power_elem(buf, index_target, index_start_cur, (offset % temp2), temp2); // left

};

void oblivious_distribute_inner_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N) {

    if (N == 0 || N == 1) {
        return ;
    }
    else if(N == 2) {
        bool swap = (buf[0].value && (index_start_cur < index_target[0])) || (buf[1].value && (index_target[1] < (index_start_cur + 1)));
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
        return;
    }

    ojoin_int_type n1, n2;

    n1 = pow2_lt(N);
    n2 = N - n1;

    // no more threads so no aggregation tree
    ojoin_int_type m2 = 0;
    ojoin_int_type temp = index_start_cur + n2;
    for (ojoin_int_type i = 0; i < n2; i++) {
        m2 += (index_target[i] < temp);
    };



    for (ojoin_int_type i = 0; i < n2; i++) {
        o_memswap(&buf[i], &buf[i + n1], sizeof(*buf), (m2 <= i));
        o_memswap(&index_target[i], &index_target[i + n1], sizeof(*index_target), (m2 <= i));
    }

    oblivious_distribute_inner_elem(buf, index_target, index_start_cur, n2);
    oblivious_distribute_inner_2power_elem(buf + n2, index_target + n2, index_start_cur + n2, (n1 - n2 + m2) % n1, n1);

};

void oblivious_distribute_inner_2power_parallel_elem(void *args_) {
    struct oblivious_distribute_inner_2power_parallel_args_elem *args = (struct oblivious_distribute_inner_2power_parallel_args_elem*)args_;
    elem_t *buf = args->buf;
    ojoin_int_type *index_target = args->index_target;
    ojoin_int_type index_start_cur = args->index_start_cur;
    ojoin_int_type offset = args->offset;
    ojoin_int_type N = args->N;
    ojoin_int_type nthreads = args->nthreads;
    

    if (nthreads <= 1 || N < 16) {
        oblivious_distribute_inner_2power_elem(buf, index_target, index_start_cur, offset, N);
        return ;
    }

    ojoin_int_type m2 = 0;
    ojoin_int_type temp2 = N / 2;
    ojoin_int_type temp = index_start_cur + temp2;
    for (ojoin_int_type i = 0; i < N; i++) {
        m2 += (index_target[i] < temp);
    };

    
    /*
    if (N == 2) {
        bool swap = !(m2 ^ offset);
        o_memswap(&buf[0], &buf[1], sizeof(*buf), swap);
        o_memswap(&index_target[0], &index_target[1], sizeof(*index_target), swap);
        return ;
    }
    */

    /*
    ojoin_int_type ii = (m2 - N + offset) % temp;
    ojoin_int_type * L_ptr = buf;
    ojoin_int_type * R_ptr = buf + temp;
    ojoin_int_type * L_ptr_index = index_target;
    ojoin_int_type * R_ptr_index = index_target + temp;
    for (ojoin_int_type i = 0; i < temp; i++) {
        o_memswap(L_ptr + i, R_ptr + i, sizeof(*buf), (ii <= i));
        o_memswap(L_ptr + i, R_ptr + i, sizeof(*index_target), (ii <= i));
    }
    */

    bool condition_0 = (offset < temp2);
    bool condition_1 = (((offset % temp2) + m2) < temp2);
    bool condition_2 = condition_0 ^ condition_1;
    ojoin_int_type ii = (offset + m2) % temp2;
    
    struct oswap_range2_args_elem args1[nthreads];
    struct oswap_range2_args args2[nthreads];
    ojoin_int_type inc = temp2 / nthreads;
    ojoin_int_type extra = temp2 % nthreads;
    ojoin_int_type last = 0;

    
    for (ojoin_int_type i=0; i<nthreads; ++i) {
        ojoin_int_type next = last + inc + (i < extra);

        args1[i].swap_start = last;
        args1[i].swap_end = next;
        args1[i].offset_m1_mod = ii;
        args1[i].buf1 = buf;
        args1[i].buf2 = buf + temp2;
        args1[i].swap_flag = condition_2;

        args2[i].swap_start = last;
        args2[i].swap_end = next;
        args2[i].offset_m1_mod = ii;
        args2[i].buf1 = index_target;
        args2[i].buf2 = index_target + temp2;
        args2[i].swap_flag = condition_2;

        last = next;
    }
    
    struct thread_work multi_work[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work[i].type = THREAD_WORK_SINGLE;
        multi_work[i].single.func = oswap_range2_elem;
        multi_work[i].single.arg = &args1[i];
        thread_work_push(&multi_work[i]);
    }
    
    
    oswap_range2_elem((void*)(args1+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work[i]);
    }

    
    struct thread_work multi_work2[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work2[i].type = THREAD_WORK_SINGLE;
        multi_work2[i].single.func = oswap_range2;
        multi_work2[i].single.arg = &args2[i];
        thread_work_push(&multi_work2[i]);
    }
    
    oswap_range2((void*)(args2+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work2[i]);
    }
    
    ojoin_int_type lthreads = nthreads/2;
    ojoin_int_type rthreads = nthreads - lthreads;

    /* Dispatch the right half to thread g_thread_id + lthreads; it will inherit threads
        g_thread_id + lthreads .. g_thread_id + nthreads-1. */
    
    struct oblivious_distribute_inner_2power_parallel_args_elem right_args = {
        buf+ temp2, index_target+temp2, index_start_cur+temp2, ((offset + m2) % temp2), temp2, rthreads
    };
    struct oblivious_distribute_inner_2power_parallel_args_elem left_args = {
        buf, index_target, index_start_cur, (offset % temp2), temp2, lthreads
    };
    
    struct thread_work right_work = {
        .type = THREAD_WORK_SINGLE,
        .single = {
        .func = oblivious_distribute_inner_2power_parallel_elem,
        .arg = &right_args,
        }
    };

    thread_work_push(&right_work);
    
    oblivious_distribute_inner_2power_parallel_elem(&left_args);
    
    thread_wait(&right_work);

};

void oblivious_distribute_inner_parallel_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N, ojoin_int_type nthreads) {

    if (nthreads <= 1 || N < 16) {
        oblivious_distribute_inner_elem(buf, index_target, index_start_cur, N);
        return ;
    }

    ojoin_int_type n1, n2;

    n1 = pow2_lt(N);
    n2 = N - n1;

    // aggregation tree
    ojoin_int_type m2 = 0;
    ojoin_int_type temp = index_start_cur + n2;
    for (ojoin_int_type i = 0; i < n2; i++) {
        m2 += (index_target[i] < temp);
    };
    
    struct oswap_range2_args_elem args[nthreads];
    struct oswap_range2_args args2[nthreads];
    ojoin_int_type inc = n2 / nthreads;
    ojoin_int_type extra = n2 % nthreads;
    ojoin_int_type last = 0;


    for (ojoin_int_type i=0; i<nthreads; ++i) {
        ojoin_int_type next = last + inc + (i < extra);
        
        args[i].swap_start = last;
        args[i].swap_end = next;
        args[i].offset_m1_mod = m2;
        args[i].buf1 = buf;
        args[i].buf2 = buf + n1;
        args[i].swap_flag = false;

        args2[i].swap_start = last;
        args2[i].swap_end = next;
        args2[i].offset_m1_mod = m2;
        args2[i].buf1 = index_target;
        args2[i].buf2 = index_target + n1;
        args2[i].swap_flag = false;

        last = next;
    }
    
    struct thread_work multi_work[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work[i].type = THREAD_WORK_SINGLE;
        multi_work[i].single.func = oswap_range2_elem;
        multi_work[i].single.arg = &args[i];
        thread_work_push(&multi_work[i]);
    }
    
    oswap_range2_elem((void*)(args+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work[i]);
    }

    struct thread_work multi_work2[nthreads-1];
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        multi_work2[i].type = THREAD_WORK_SINGLE;
        multi_work2[i].single.func = oswap_range2;
        multi_work2[i].single.arg = &args2[i];
        thread_work_push(&multi_work2[i]);
    }
    
    oswap_range2((void*)(args2+nthreads-1));
    for (ojoin_int_type i=0; i<nthreads-1; ++i) {
        thread_wait(&multi_work2[i]);
    }


    ojoin_int_type lthreads = nthreads/2;
    ojoin_int_type rthreads = nthreads - lthreads;

    struct oblivious_distribute_inner_2power_parallel_args_elem right_args = {
        buf + n2, index_target + n2, index_start_cur+n2, ((n1 - n2 + m2) % n1), n1, rthreads
    };
  
    struct thread_work right_work = {
        .type = THREAD_WORK_SINGLE,
        .single = {
            .func = oblivious_distribute_inner_2power_parallel_elem,
            .arg = &right_args,
        },
    };
    thread_work_push(&right_work);
    oblivious_distribute_inner_parallel_elem(buf, index_target, index_start_cur, n2, lthreads);
    thread_wait(&right_work);

}

void oblivious_distribute_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type length, ojoin_int_type number_threads) {

    oblivious_distribute_inner_parallel_elem(buf, index_target, 0, length, number_threads);
};