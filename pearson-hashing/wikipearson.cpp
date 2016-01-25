#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*
 * Pearson hashing (from Wikipedia)
 *
 * Pearson hashing is a hash function designed for fast execution on processors with 8-bit registers.
 * Given an input consisting of any number of bytes, it produces as output a single byte that is strongly
 * dependent on every byte of the input. Its implementation requires only a few instructions, plus a
 * 256-byte lookup table containing a permutation of the values 0 through 255.
 */

// T table for Pearson hashing from RFC 3074.
unsigned char T[256] = {
    251, 175, 119, 215, 81, 14, 79, 191, 103, 49, 181, 143, 186, 157,  0,
    232, 31, 32, 55, 60, 152, 58, 17, 237, 174, 70, 160, 144, 220, 90, 57,
    223, 59,  3, 18, 140, 111, 166, 203, 196, 134, 243, 124, 95, 222, 179,
    197, 65, 180, 48, 36, 15, 107, 46, 233, 130, 165, 30, 123, 161, 209, 23,
    97, 16, 40, 91, 219, 61, 100, 10, 210, 109, 250, 127, 22, 138, 29, 108,
    244, 67, 207,  9, 178, 204, 74, 98, 126, 249, 167, 116, 34, 77, 193,
    200, 121,  5, 20, 113, 71, 35, 128, 13, 182, 94, 25, 226, 227, 199, 75,
    27, 41, 245, 230, 224, 43, 225, 177, 26, 155, 150, 212, 142, 218, 115,
    241, 73, 88, 105, 39, 114, 62, 255, 192, 201, 145, 214, 168, 158, 221,
    148, 154, 122, 12, 84, 82, 163, 44, 139, 228, 236, 205, 242, 217, 11,
    187, 146, 159, 64, 86, 239, 195, 42, 106, 198, 118, 112, 184, 172, 87,
    2, 173, 117, 176, 229, 247, 253, 137, 185, 99, 164, 102, 147, 45, 66,
    231, 52, 141, 211, 194, 206, 246, 238, 56, 110, 78, 248, 63, 240, 189,
    93, 92, 51, 53, 183, 19, 171, 72, 50, 33, 104, 101, 69, 8, 252, 83, 120,
    76, 135, 85, 54, 202, 125, 188, 213, 96, 235, 136, 208, 162, 129, 190,
    132, 156, 38, 47, 1, 7, 254, 24, 4, 216, 131, 89, 21, 28, 133, 37, 153,
    149, 80, 170, 68, 6, 169, 234, 151
};

// Pearson hashing algorithm as described in Wikipedia. Equal to phash_original (more obfuscated).
// -> http://en.wikipedia.org/wiki/Pearson_hashing
// This assumes that key always ends with NULL character (\0).
unsigned char phash_wikipedia(const char *key) {
    unsigned char hash = 0;
    for (char c = *key++; c; c = *key++) 
            hash = T[hash ^ c];
    return hash;
}

// Pearson 16-bit hashing (based on Wikipedia/original).
// Instead of concatenating hashes as strings (as in original Pearson), it shifts the first and adds the second.
unsigned short phash16(const char *key) {
    unsigned char h1, h2;
    size_t length = strlen(key);
    char *buffer = malloc(sizeof(char) * length);
    memcpy(buffer, key, length), buffer[length] = 0;
    h1 = phash_wikipedia(buffer), buffer[0] = (buffer[0] + 1) % 255;
    h2 = phash_wikipedia(buffer), free(buffer);
    return (h1 << 8) + h2;
}

int main() {
    //const char key[4] = {'h','e','l','l','o'};
    unsigned char h = phash_wikipedia("hellp");
    unsigned short h3 = phash16("from");
    printf("from ==> %d in decimal | %x in hexadecimal\n ", h, h);
    //printf("phash16(from) == %d <==> (%d << 8) + %d == %d\n", h3, h1, h2, (h1 << 8) + h2);
    return 0;
}
