#ifndef DISTRIBUTED_SGX_SORT_COMMON_SORT_TYPE_H
#define DISTRIBUTED_SGX_SORT_COMMON_SORT_TYPE_H

enum sort_type {
    SORT_UNSET = 0,
    SORT_BITONIC,
    SORT_BUCKET,
    SORT_OPAQUE,
    SORT_ORSHUFFLE,
};

#endif /* distributed-sgx-sort/common/sort_type.h */
