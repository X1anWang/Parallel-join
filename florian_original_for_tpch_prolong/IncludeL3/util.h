#ifndef UTIL_H
#define UTIL_H

#include <string.h>


void reverse(char *s) {
    long long i, j;
    char c;

    for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}


// itoa implementation from *The C Programming Language*
void itoa(long long n, char *s, long long *len) {
    long long i = 0;
    long long sign;

    if ((sign = n) < 0) {
        n = -n;
        i = 0;
    }
        
    do {
        s[i++] = n % 10 + '0';
    } while ((n /= 10) > 0);
    
    if (sign < 0)
        s[i++] = '-';
    s[i] = '\0';
    
    *len = i;
    
    reverse(s);
}


// no longer required (SHA-256 is used for logs instead)
uint64_t strm_hash(uint64_t key, uint64_t seed = 0x1a8b714c) {
    constexpr uint64_t c1 = 0xCC9E2D51;
    constexpr uint64_t c2 = 0x1B873593;
    constexpr uint64_t n = 0xE6546B64;

    uint64_t k = key;
    k = k * c1;
    k = (k << 15) | (k >> 17);
    k *= c2;

    uint64_t h = k ^ seed;
    h = (h << 13) | (h >> 19);
    h = h*5 + n;

    h ^= 4;

    h ^= (h>>16);
    h *= 0x85EBCA6B;
    h ^= (h>>13);
    h *= 0xC2B2AE35;
    h ^= (h>>16);
    return h;
}

#endif
