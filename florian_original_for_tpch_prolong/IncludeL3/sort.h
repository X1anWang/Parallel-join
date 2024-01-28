#ifndef SORT_H
#define SORT_H

#include <assert.h>
#include <math.h>
#ifdef SUBTIME
#include <time.h>
#endif
#include "trace_mem.h"

#define TIME_VAL ((clock() - begin) / (float)CLOCKS_PER_SEC)


inline bool is_pow_two(long long x) {
    return (x & (x-1)) == 0;
}

inline long long prev_pow_two(long long x) {
    long long y = 1;
    while (y < x) y <<= 1;
    return y >>= 1;
}


template <typename T, bool (*comp_func)(T e1, T e2)>
void bitonic_compare(TraceMem<T> *traceMem, bool ascend, long long i, long long j) {
    T e1 = traceMem->read(i);
    T e2 = traceMem->read(j);
    traceMem->write(i, (!comp_func(e1, e2) == ascend) ? e2 : e1);
    traceMem->write(j, (!comp_func(e1, e2) == ascend) ? e1 : e2);
}


template <typename T, bool (*comp_func)(T e1, T e2)>
void bitonic_merge(TraceMem<T> *traceMem, bool ascend, long long lo, long long hi) {
    if (hi <= lo + 1) return;

    long long mid_len = prev_pow_two(hi - lo);

    for (long long i = lo; i < hi - mid_len; i++)
        bitonic_compare<T, comp_func>(traceMem, ascend, i, i + mid_len);
    bitonic_merge<T, comp_func>(traceMem, ascend, lo, lo + mid_len);
    bitonic_merge<T, comp_func>(traceMem, ascend, lo + mid_len, hi);
}


template <typename T, bool (*comp_func)(T e1, T e2)>
void bitonic_sort(TraceMem<T> *traceMem, bool ascend = true, long long lo = 0, long long hi = -1) {
    if (hi == -1) hi = traceMem->size;

    long long mid = lo + (hi - lo) / 2;

    if (mid == lo) return;

    bitonic_sort<T, comp_func>(traceMem, !ascend, lo, mid);
    bitonic_sort<T, comp_func>(traceMem, ascend, mid, hi);
    bitonic_merge<T, comp_func>(traceMem, ascend, lo, hi);
}


template <typename T, bool (*filter_func)(T e)>
bool filter_func_comp(T e1, T e2) {
    long long res = (filter_func(e1) * true) + ((!filter_func(e1)) * (!filter_func(e2)));
    return res;
}

template <typename T, bool (*filter_func)(T e)>
void obliv_filter(TraceMem<T> *traceMem) {
    bitonic_sort<T, filter_func_comp<T, filter_func>>(traceMem);
}


template <typename T, long long (*ind_func)(T e)>
bool ind_func_comp(T e1, T e2) {
    long long res = ((ind_func(e1) == (-1)) * false) + ((!(ind_func(e1) == (-1))) * (((ind_func(e2) == (-1)) * true) + ((!(ind_func(e2) == (-1))) * (ind_func(e1) < ind_func(e2)))));
    return res;
}

// ind_func must be such that ind_func(dummy) = -1
template <typename T, long long (*ind_func)(T e)>
void obliv_distribute(TraceMem<T> *traceMem, long long m) {
    #ifdef SUBTIME
    clock_t begin = clock();
    #endif
    
    bitonic_sort<T, ind_func_comp<T, ind_func>>(traceMem);
    
    #ifdef SUBTIME
    printf("Sorting within oblivious distribute: %.2fs\n", TIME_VAL);
    #endif
    
    #ifdef SUBTIME
    begin = clock();
    #endif

    traceMem->resize(m);

    for (long long j = prev_pow_two(m); j >= 1; j /= 2) {
        for (long long i = m - j - 1; i >= 0; i--) {
            T e = traceMem->read(i);
            __sync_synchronize();
            long long dest_i = ind_func(e);
            __sync_synchronize();
            assert(dest_i < m);
            T e1 = traceMem->read(i + j);
            traceMem->write(i, dest_i >= i + j ? e1 : e);
            traceMem->write(i + j, dest_i >= i + j ? e : e1);
        }
    }
    
    #ifdef SUBTIME
    printf("Remaining operations in oblivious distribute: %.2fs\n", TIME_VAL);
    #endif
}

#endif