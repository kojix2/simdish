// Use SIMDe for cross-platform SIMD support
#define SIMDE_ENABLE_NATIVE_ALIASES
#include "simde/x86/avx2.h"

// Vector multiplication using SIMD for Float32 arrays
// a, b: Input arrays (processed 8 elements at a time)
// result: Array to store the result
void simd_mul(const float *a, const float *b, float *result) {
    // Load data into SIMD registers
    simde__m256 va = simde_mm256_loadu_ps(a);
    simde__m256 vb = simde_mm256_loadu_ps(b);
    
    // Perform multiplication
    simde__m256 vresult = simde_mm256_mul_ps(va, vb);
    
    // Store result back to memory
    simde_mm256_storeu_ps(result, vresult);
}
