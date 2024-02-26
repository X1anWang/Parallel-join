#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_QSORT_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_QSORT_H

#include <stddef.h>

void
qsort_glibc (void *const pbase, size_t total_elems, size_t size,
	    int (*cmp)(const void *, const void *, void *), void *arg);

#endif /* distributed-sgx-sort/enclave/qsort.h */
