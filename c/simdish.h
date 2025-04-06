#ifndef SIMDISH_H
#define SIMDISH_H

// Vector addition using SIMD for Float32 arrays
void simd_add(const float *a, const float *b, float *result);

// Vector subtraction using SIMD for Float32 arrays
void simd_sub(const float *a, const float *b, float *result);

// Vector multiplication using SIMD for Float32 arrays
void simd_mul(const float *a, const float *b, float *result);

// Vector division using SIMD for Float32 arrays
void simd_div(const float *a, const float *b, float *result);

#endif // SIMDISH_H
