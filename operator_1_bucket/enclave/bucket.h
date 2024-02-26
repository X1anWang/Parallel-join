#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_BUCKET_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_BUCKET_H

#include <stddef.h>
#include "common/elem_t.h"

#define BUCKET_SIZE 512

/* The number of buckets to send/receive from the remote at a time during
 * merge-split. */
#define SWAP_CHUNK_BUCKETS 1

int bucket_init(void);
void bucket_init_prealloc(elem_t *buffer);
void bucket_free(void);
int bucket_sort(elem_t *arr, size_t length, size_t num_threads);

#endif /* distributed-sgx-sort/enclave/bucket.h */
