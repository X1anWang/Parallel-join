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

void ecall_release_threads(void) {
    thread_release_all();
}

void ecall_unrelease_threads(void) {
    thread_unrelease_all();
}

int ecall_ojoin_init(int world_rank_, int world_size_, size_t num_threads) {
    int ret;

    world_rank = world_rank_;
    world_size = world_size_;
    total_num_threads = num_threads;

    ret = rand_init();
    if (ret) {
        handle_error_string("Error initializing RNG");
        goto exit;
    }
    
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

void ecall_ojoin_free_arr(void) {
    mpi_tls_bytes_sent = 0;
}

void ecall_ojoin_free(void) {
    mpi_tls_free();
    rand_free();
}

void ecall_start_work(void) {
    thread_start_work();
}

int ecall_scalable_oblivious_join(char *input_path, size_t len) {
    printf("\n(1) Entered enclave");
    printf("\n(2) Size of block is:%ld", sizeof(elem_t));
    printf("\n(3) Start reading data");
    (void)len;

    char *length;
    length = strtok(input_path, " ");
    int length1 = atoi(length);
    length = strtok(NULL, "\n");
    int length2 = atoi(length);
    arr = calloc((length1 + length2), sizeof(*arr));
    char key_temp[22];
    char* key_temp_ptr;

    for (int i = 0; i < length1; i++) {
        strncpy(key_temp, strtok(NULL, " "), 21);
        arr[i].key = strtoull(key_temp, &key_temp_ptr, 10);
        //strncpy(arr[i].key, strtok(NULL, " "), KEY_LENGTH - 1);
        strncpy(arr[i].data, strtok(NULL, "\n"), DATA_LENGTH - 1);
        arr[i].table_0 = true;
    }
    for (int i = length1; i < length1 + length2; i++) {
        strncpy(key_temp, strtok(NULL, " "), 21);
        arr[i].key = strtoull(key_temp, &key_temp_ptr, 10);
        //strncpy(arr[i].key, strtok(NULL, " "), KEY_LENGTH - 1);
        strncpy(arr[i].data, strtok(NULL, "\n"), DATA_LENGTH - 1);
        arr[i].table_0 = false;
    }
    /*
    for (int i = 0 ; i < length1 + length2; i++) {
        printf("\n %d th TID:%d key: %s", i, (1 - arr[i].table_0), arr[i].key);
    }
    */
    /*
    printf("\n 0 th TID:%d key: %s", (1 - arr[0].table_0), arr[0].key);
    printf("\n %d th TID:%d key: %s", length1, (1 - arr[length1].table_0), arr[length1].key);
    */
    /*
    for (int i = 0; i < KEY_LENGTH - 1; i++) {
        arr[0].key[i] = arr[0].key[i+1];
    }
    for (int i = 0; i < KEY_LENGTH - 1; i++) {
        arr[length1].key[i] = arr[length1].key[i+1];
    }
    for (int i = 0; i < KEY_LENGTH - 1; i++) {
        arr[length1].key[i] = arr[length1].key[i+1];
    }
    */
    /*
    printf("\n 0 th TID:%d key: %s", (1 - arr[0].table_0), arr[0].key);
    printf("\n %d th TID:%d key: %s", length1, (1 - arr[length1].table_0), arr[length1].key);
    */
    /*
    for (int i = 0 ; i < length1 + length2; i++) {
        printf("\n 222 %d th TID:%d key: %lu data: %s", i, (1 - arr[i].table_0), arr[i].key, arr[i].data);
    }
    */
    

    printf("\n(4) Complete reading data");
    scalable_oblivious_join(arr, length1, length2, input_path);

    printf("\n(13) Returned from operator_3 step_2 fuction");
    free(arr);

    return 0;
}