#include <rapidfuzz/fuzz.hpp>
#include <stdint.h>
#include <iostream>

extern "C" {
    double ratio(const char* left, const char* right) {
        return rapidfuzz::fuzz::ratio(left, right);
    }
}