#include <stdio.h>
#include <liboblivious/primitives.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/error.h"
#include "common/algorithm_type.h"
#include "common/util.h"
#include "enclave/bitonic.h"
#include "enclave/crypto.h"
#include "enclave/mpi_tls.h"
#include "enclave/threading.h"
#include "enclave/scalable_oblivious_join.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

int world_rank;
int world_size;

static elem_t *arr;
static elem_t *arr1;
static elem_t *arr2;
//static ojoin_int_type nthreads_total;
static ojoin_int_type length_total;
static ojoin_int_type length_table;
static ojoin_int_type length_max;

static volatile enum algorithm_type algorithm_type;

int ecall_sort_init(int world_rank_, int world_size_, size_t num_threads) {
    int ret;

    /* Set global parameters. */
    world_rank = world_rank_;
    world_size = world_size_;
    total_num_threads = num_threads;

    /* Init entropy. */
    ret = rand_init();
    if (ret) {
        handle_error_string("Error initializing RNG");
        goto exit;
    }

    /* Init MPI-over-TLS. */
    ret = mpi_tls_init(world_rank, world_size, &entropy_ctx);
    if (ret) {
        handle_error_string("Error initializing MPI-over-TLS");
        goto exit_free_rand;
    }

exit:
    return ret;

exit_free_rand:
    rand_free();
    return ret;
}

int ecall_sort_alloc_arr(size_t length_total_) {
    length_total = length_total_;
    size_t local_length =
            ((world_rank + 1) * length_total + world_size - 1) / world_size
            - (world_rank * length_total + world_size - 1) / world_size;
    int ret;

    size_t data_size;
    size_t alloc_size;

    data_size = local_length;
    alloc_size = local_length;


    arr = calloc(alloc_size, sizeof (*arr));
    if (!arr) {
        perror("malloc arr");
        ret = -1;
        goto exit;
    }
    srand(world_rank + 1);
    for (size_t i = 0; i < data_size; i++) {
        arr[i].key = rand();
    }

    ret = 0;

exit:
    return ret;
}

void ecall_sort_free_arr(void) {
    free(arr);
    mpi_tls_bytes_sent = 0;
}

void ecall_sort_free(void) {
    mpi_tls_free();
    rand_free();
}

int ecall_verify_sorted(void) {
    return 0;
}

void ecall_start_sort_work(void) {
    /* Wait for master thread to choose sort. */
    while (!algorithm_type) {
    }


    /* Initialize sort. */
    if (bitonic_init()) {
        handle_error_string("Error initializing sort");
        return;
    }

    /* Start work. */
    thread_start_work();

    /* Free sort. */
    bitonic_free();

}

void ecall_release_threads(void) {
    thread_release_all();
}

void ecall_unrelease_threads(void) {
    thread_unrelease_all();
}

int ecall_bitonic_sort(void) {
    int ret = -1;

    algorithm_type = SORT_BITONIC;

    /* Initialize sort. */
    if (bitonic_init()) {
        handle_error_string("Error initializing sort");
        goto exit;
    }

    /* Sort. */
    bitonic_sort(arr, length_total, total_num_threads, false);

    ret = 0;

    bitonic_free();
exit:
    return ret;
}

void ecall_get_stats(struct ocall_enclave_stats *stats) {
    stats->mpi_tls_bytes_sent = mpi_tls_bytes_sent;
}

int ecall_ojoin_init(int world_rank_, int world_size_, size_t num_threads) {
    int ret;

    /* Set global parameters. */
    world_rank = world_rank_;
    world_size = world_size_;
    //nthreads_total = num_threads;
    total_num_threads = num_threads;

    /* Init entropy. */
    ret = rand_init();
    if (ret) {
        handle_error_string("Error initializing RNG");
        goto exit;
    }

    /* Init MPI-over-TLS. */
    ret = mpi_tls_init(world_rank, world_size, &entropy_ctx);
    if (ret) {
        handle_error_string("Error initializing MPI-over-TLS");
        goto exit_free_rand;
    }

    scalable_oblivious_join_init(num_threads);

exit:
    return ret;

exit_free_rand:
    rand_free();
    return ret;
}


int ecall_ojoin_alloc_arr(int length_max_, int key_scope) {
    
    length_max = 1 << length_max_;
    length_table = length_max / 2;
    arr = calloc(length_max, sizeof(*arr));
    key_scope = key_scope;

    /*
    srand(world_rank + 1);
    for (int i = 0; i < length_total; i++) {
        arr[i].key = (rand() % (key_scope * length_table / 8)) + 1;
        arr[i].has_value = true;
        arr[i].table_0 = (i < length_table);
    }
    */
        arr[0].key = 8;
        //arr[0].true_key = 8;
        arr[0].data[0] = 8;
        arr[0].has_value = true;
        arr[0].table_0 = true;
        for (int i = 1; i < length_max; i++) {
            if (i % 2 == 0) {
                arr[i].key = 7;
                //arr[i].true_key = 7;
                arr[i].table_0 = true;
            } else {
                arr[i].key = 8;
                //arr[i].true_key = 8;
                //arr[i].data = 8;
                arr[i].table_0 = false;
            }
            arr[i].data[0] = 7;
            arr[i].has_value = true;
        }

    arr1 = arr;
    arr2 = arr + length_table;

    return 0;
}

void ecall_ojoin_free_arr(void) {
    //free(arr);
    mpi_tls_bytes_sent = 0;
}

void ecall_ojoin_free(void) {
    mpi_tls_free();
    rand_free();
}

int ecall_verify_joined(void) {
    return 0;
}

void ecall_start_work(void) {
        /* Initialize sort. */
    if (bitonic_init()) {
        handle_error_string("Error initializing sort");
        return;
    }

    /* Start work. */
    thread_start_work();

    /* Free sort. */
    bitonic_free();
}

int ecall_scalable_oblivious_join(char *input_path, size_t len) {
    printf("\nEntered enclave");
    (void)len;

    // Parse to table
    char *length;
    length = strtok(input_path, " ");
    int length1 = atoi(length);
    length = strtok(NULL, "\n");
    int length2 = atoi(length);
    elem_t *arr = calloc((length1 + length2), sizeof(*arr));
    //printf("\nlength 1 is:%d", length1);
    //printf("\nlength 2 is:%d", length2);
    for (int i = 0; i < length1; i++) {
        arr[i].key = atoll(strtok(NULL, " "));
        strncpy(arr[i].data, strtok(NULL, "\n"), DATA_LENGTH);
        arr[i].table_0 = true;
        arr[i].value = false;
        //printf("\n%dth table 0 read key:%d read data:%s", i, arr[i].key, arr[i].data);
    }
    for (int i = length1; i < length1 + length2; i++) {
        arr[i].key = atoll(strtok(NULL, " "));
        strncpy(arr[i].data, strtok(NULL, "\n"), DATA_LENGTH);
        arr[i].table_0 = false;
        arr[i].value = false;
        //printf("\n%dth table 1 read key:%d read data:%s", i, arr[i].key, arr[i].data);
    }


    scalable_oblivious_join(arr, length1, length2, input_path);

    printf("\nReturned");
    free(arr);

    return 0;
}