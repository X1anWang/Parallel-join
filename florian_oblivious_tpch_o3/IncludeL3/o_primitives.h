#ifndef O_PRIM
#define O_PRIM

#define LIBOBLIVIOUS_EXTERNC_BEGIN extern "C" {
#define LIBOBLIVIOUS_EXTERNC_END }
#define LIBOBLIVIOUS_EXTERNC extern "C"
#define LIBOBLIVIOUS_RESTRICT __restrict

static void o_memswap_new(void *LIBOBLIVIOUS_RESTRICT a_, void *LIBOBLIVIOUS_RESTRICT b_, size_t n,
        int lhs, int rhs) {
    
    unsigned char *LIBOBLIVIOUS_RESTRICT a = (unsigned char *) a_;
    unsigned char *LIBOBLIVIOUS_RESTRICT b = (unsigned char *) b_;

    //unsigned __int128 overflowing_iff_lt = (__int128) lhs - (__int128) rhs;
    //unsigned __int128 overflowing_iff_gt = (__int128) rhs - (__int128) lhs;
    //int is_less_than = (int) -(overflowing_iff_lt >> 127); // -1 if self < other, 0 otherwise.
    //int result = (int) (overflowing_iff_gt >> 127); // 1 if self > other, 0 otherwise.
    //int result = is_less_than + is_greater_than;
    int result = (lhs > rhs);
    unsigned char mask = ~((unsigned char) result - 1);
    for (size_t i = 0; i < n; i++) {
        *(a+i) ^= *(b+i);
        *(b+i) ^= *(a+i) & mask;
        *(a+i) ^= *(b+i);
    }
}

static void o_memswap(void *LIBOBLIVIOUS_RESTRICT a_, void *LIBOBLIVIOUS_RESTRICT b_, size_t n, int cond) {
    
    unsigned char *LIBOBLIVIOUS_RESTRICT a = (unsigned char *) a_;
    unsigned char *LIBOBLIVIOUS_RESTRICT b = (unsigned char *) b_;

    //unsigned __int128 overflowing_iff_lt = (__int128) lhs - (__int128) rhs;
    //unsigned __int128 overflowing_iff_gt = (__int128) rhs - (__int128) lhs;
    //int is_less_than = (int) -(overflowing_iff_lt >> 127); // -1 if self < other, 0 otherwise.
    //int result = (int) (overflowing_iff_gt >> 127); // 1 if self > other, 0 otherwise.
    //int result = is_less_than + is_greater_than;
    unsigned char mask = ~((unsigned char) cond - 1);
    for (size_t i = 0; i < n; i++) {
        *(a+i) ^= *(b+i);
        *(b+i) ^= *(a+i) & mask;
        *(a+i) ^= *(b+i);
    }
}

static inline void o_setc(unsigned char *dest, unsigned char src, bool cond) {
    unsigned char mask = ~((unsigned char) cond - 1);
    *dest ^= (src ^ *dest) & mask;
}


static inline void *o_memcpy(void *LIBOBLIVIOUS_RESTRICT dest_,
        const void *LIBOBLIVIOUS_RESTRICT src_, size_t n, bool cond) {
    const unsigned char *LIBOBLIVIOUS_RESTRICT src =
        (const unsigned char *) src_;
    unsigned char *LIBOBLIVIOUS_RESTRICT dest = (unsigned char *) dest_;

    for (size_t i = 0; i < n; i++) {
        o_setc(&dest[i], src[i], cond);
    }

    return dest_;
}


#endif