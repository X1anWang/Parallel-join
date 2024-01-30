#ifndef BITON
#define BITON
#include "o_primitives.h"

#define SWAP_CHUNK_SIZE 4096

static size_t total_length;

static void swap_local_range(elem_t *arr, size_t a, size_t b, size_t count, bool crossover) {
    //size_t local_start = get_local_start(world_rank);

    //get_time3(false, 0);
    if (crossover) {
        for (size_t i = 0; i < count; i++) {
            //bool cond = CTcmp(arr[a + i].key, arr[b + count - 1 - i].key);
            o_memswap_new(&arr[a + i],
                    &arr[b + count - 1 - i], sizeof(*arr),
                    arr[a + i].key, arr[b + count - 1 - i].key);
        }
    } else {
        for (size_t i = 0; i < count; i++) {
            o_memswap_new(&arr[a + i], &arr[b + i],
                    sizeof(*arr), arr[a + i].key, arr[b + i].key);
        }
    }
    //get_time3(true, count);
}

/* Bitonic sort. */

struct merge_args {
    elem_t *arr;
    size_t start;
    size_t length;
    bool crossover;
    size_t num_threads;
};
static void merge(elem_t *arr, size_t start, size_t length, bool crossover) {

    if (length == 2) {
        swap_local_range(arr, start, start + 1, 1, false);
    }
    else if (2 < length){
            /* If the length is odd, bubble sort an element to the end of the
             * array and leave it there. */
            size_t left_length = length / 2;
            size_t right_length = length - left_length;
            size_t right_start = start + left_length;
            swap_local_range(arr, start, right_start, left_length, crossover);

            /* Merge both in our own thread. */
            
            merge(arr, start, left_length, false);
            merge(arr, start, right_length, false);
    }
}

static void sort(elem_t *arr, size_t start, size_t length) {

    if (length == 2) {
        swap_local_range(arr, start, start + 1, 1, false);
    } else if (2 < length) {
        size_t left_length = length / 2;
        size_t right_length = length - left_length;
            size_t right_start = start + left_length;
            
                /* Sort both in our own thread. */
                sort(arr, start, left_length);
                sort(arr, right_start, right_length);

            merge(arr, start, length, true);
    }
}

/* Entry. */
static inline unsigned long long log2ll(unsigned long long x) {
#ifdef __GNUC__
    return sizeof(x) * CHAR_BIT - __builtin_clzll(x) - 1;
#else
    unsigned long long log = -1;
    while (x) {
        log++;
        x >>= 1;
    }
    return log;
#endif
}

void bitonic_sort(elem_t *arr, size_t length) {
    total_length = length;
    
    if (1lu << log2ll(length) != length) {
        printf("Length must be a multiple of 2\n");
    }

    /* Start work for this thread. */
    
    sort(arr, 0, total_length);

}
#endif