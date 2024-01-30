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
#ifdef LIBOBLIVIOUS_CMOV
    if (__builtin_constant_p(cond)) {
        if (cond) {
            *dest = src;
        }
        return;
    }

    unsigned int src_i = src;
    unsigned int dest_i = *dest;
    __asm__ ("cmpb $0, %2;"
            "cmovnz %1, %0;"
            : "+r" (dest_i)
            : "rm" ((unsigned int) src_i), "rm" (cond)
            : "flags");
    *dest = dest_i;
#else
    unsigned char mask = ~((unsigned char) cond - 1);
    *dest ^= (src ^ *dest) & mask;
#endif
}

#ifdef LIBOBLIVIOUS_CMOV
#define LIBOBLIVIOUS_DEF_SET_T(NAME, T) \
    static inline void NAME(T *dest, T src, bool cond) {\
        if (__builtin_constant_p(cond)) {\
            if (cond) {\
                *dest = src;\
            }\
            return;\
        }\
    \
        __asm__ ("cmpb $0, %2;"\
                "cmovnz %1, %0;"\
                : "+r" (*dest)\
                : "rm" (src), "rm" (cond)\
                : "memory", "flags");\
    }
#else
#define LIBOBLIVIOUS_DEF_SET_T(NAME, T) \
    static inline void NAME(T *dest, T src, bool cond) {\
        T mask = ~((T) cond - 1);\
        *dest ^= (src ^ *dest) & mask;\
    }
#endif


static inline void *o_memcpy(void *LIBOBLIVIOUS_RESTRICT dest_,
        const void *LIBOBLIVIOUS_RESTRICT src_, size_t n, bool cond) {
    const unsigned char *LIBOBLIVIOUS_RESTRICT src =
        (const unsigned char *) src_;
    unsigned char *LIBOBLIVIOUS_RESTRICT dest = (unsigned char *) dest_;

#ifdef LIBOBLIVIOUS_CMOV
    if (__builtin_constant_p(cond)) {
        if (cond) {
            memcpy(dest, src, n);
        }
        return dest;
    }

    while (n % sizeof(unsigned short)) {
        o_setc(dest, *src, cond);
        src += sizeof(unsigned char);
        dest += sizeof(unsigned char);
        n -= sizeof(unsigned char);
    }

    while (n % sizeof(unsigned int)) {
        o_setshrt((unsigned short *) dest, *((const unsigned short *) src),
                cond);
        src += sizeof(unsigned short);
        dest += sizeof(unsigned short);
        n -= sizeof(unsigned short);
    }

    while (n % sizeof(unsigned long)) {
        o_seti((unsigned int *) dest, *((const unsigned int *) src), cond);
        src += sizeof(unsigned int);
        dest += sizeof(unsigned int);
        n -= sizeof(unsigned int);
    }

    while (n / sizeof(unsigned long) % 4) {
        o_setl((unsigned long *) dest, *((const unsigned long *) src), cond);
        src += sizeof(unsigned long);
        dest += sizeof(unsigned long);
        n -= sizeof(unsigned long);
    }

    if (n > 0) {
        size_t iters = n / (sizeof(unsigned long) * 4);
        register unsigned long t0;
        register unsigned long t1;
        register unsigned long t2;
        register unsigned long t3;
        __asm__ __volatile__ ("0:"
                "cmpb $0, %7;"
                "mov (%0), %3;"
                "mov %c8(%0), %4;"
                "mov %c9(%0), %5;"
                "mov %c10(%0), %6;"
                "cmovnz (%1), %3;"
                "cmovnz %c8(%1), %4;"
                "cmovnz %c9(%1), %5;"
                "cmovnz %c10(%1), %6;"
                "mov %3, (%0);"
                "mov %4, %c8(%0);"
                "mov %5, %c9(%0);"
                "mov %6, %c10(%0);"
                "add %11, %0;"
                "add %11, %1;"
                "dec %2;"
                "jnz 0b;"
                : "+r" (dest), "+r" (src), "+rm" (iters), "=&r" (t0),
                    "=&r" (t1), "=&r" (t2), "=&r" (t3)
                : "rm" (cond), "i" (sizeof(unsigned long)),
                    "i" (sizeof(unsigned long) * 2),
                    "i" (sizeof(unsigned long) * 3),
                    "i" (sizeof(unsigned long) * 4)
                : "memory", "flags");
    }
#else
    for (size_t i = 0; i < n; i++) {
        o_setc(&dest[i], src[i], cond);
    }
#endif

    return dest_;
}


#endif