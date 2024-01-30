#ifndef UTIL_H
#define UTIL_H

#include <string.h>


void reverse(char *s) {
    int i, j;
    char c;

    for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}


// itoa implementation from *The C Programming Language*
void itoa(int n, char *s, int *len) {
    int i, sign;

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
uint32_t strm_hash(uint32_t key, uint32_t seed = 0x1a8b714c) {
    constexpr uint32_t c1 = 0xCC9E2D51;
    constexpr uint32_t c2 = 0x1B873593;
    constexpr uint32_t n = 0xE6546B64;

    uint32_t k = key;
    k = k * c1;
    k = (k << 15) | (k >> 17);
    k *= c2;

    uint32_t h = k ^ seed;
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
