#include "common/util.h"

void *bsearch_ge(const void *key, const void *arr_, size_t num_elems,
        size_t elem_size, int (*comparator)(const void *a, const void *b)) {
    const unsigned char *arr = arr_;
    size_t left = 0;
    size_t right = num_elems;

    while (left < right) {
        size_t mid = (left + right) / 2;
        int cmp = comparator(key, arr + mid * elem_size);
        if (cmp == 0) {
            return (void *) (arr + mid * elem_size);
        } else if (cmp < 0) {
            right = mid;
        } else {
            left = mid + 1;
        }
    }

    return (void *) (arr + left * elem_size);
}

