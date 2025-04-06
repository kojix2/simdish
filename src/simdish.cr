# SIMDish - Crystal language SIMD support through C FFI
#
# This module provides bindings to SIMD-accelerated functions implemented in C
# using SIMD intrinsics.
module SIMDish
  VERSION = "0.1.0"

  # FFI bindings to C functions
  {% if flag?(:darwin) %}
    @[Link(ldflags: "#{__DIR__}/../c/libsimdish.dylib")]
  {% else %}
    @[Link(ldflags: "#{__DIR__}/../c/libsimdish.so")]
  {% end %}
  lib LibSIMDish
    # Vector addition using SIMD for Float32 arrays
    fun simd_add(a : Float32*, b : Float32*, result : Float32*) : Void

    # Vector subtraction using SIMD for Float32 arrays
    fun simd_sub(a : Float32*, b : Float32*, result : Float32*) : Void

    # Vector multiplication using SIMD for Float32 arrays
    fun simd_mul(a : Float32*, b : Float32*, result : Float32*) : Void

    # Vector division using SIMD for Float32 arrays
    fun simd_div(a : Float32*, b : Float32*, result : Float32*) : Void
  end

  # Convenient wrapper methods

  # Addition of Float32 arrays using SIMD
  def self.add(a : Slice(Float32), b : Slice(Float32)) : Slice(Float32)
    raise ArgumentError.new("Arrays must have the same size") if a.size != b.size
    raise ArgumentError.new("Array size must be a multiple of 8") if a.size % 8 != 0

    result = Slice(Float32).new(a.size)

    # Process 8 elements at a time
    (0...a.size).step(8) do |i|
      LibSIMDish.simd_add(a.to_unsafe + i, b.to_unsafe + i, result.to_unsafe + i)
    end

    result
  end

  # Subtraction of Float32 arrays using SIMD
  def self.sub(a : Slice(Float32), b : Slice(Float32)) : Slice(Float32)
    raise ArgumentError.new("Arrays must have the same size") if a.size != b.size
    raise ArgumentError.new("Array size must be a multiple of 8") if a.size % 8 != 0

    result = Slice(Float32).new(a.size)

    # Process 8 elements at a time
    (0...a.size).step(8) do |i|
      LibSIMDish.simd_sub(a.to_unsafe + i, b.to_unsafe + i, result.to_unsafe + i)
    end

    result
  end

  # Multiplication of Float32 arrays using SIMD
  def self.mul(a : Slice(Float32), b : Slice(Float32)) : Slice(Float32)
    raise ArgumentError.new("Arrays must have the same size") if a.size != b.size
    raise ArgumentError.new("Array size must be a multiple of 8") if a.size % 8 != 0

    result = Slice(Float32).new(a.size)

    # Process 8 elements at a time
    (0...a.size).step(8) do |i|
      LibSIMDish.simd_mul(a.to_unsafe + i, b.to_unsafe + i, result.to_unsafe + i)
    end

    result
  end

  # Division of Float32 arrays using SIMD
  def self.div(a : Slice(Float32), b : Slice(Float32)) : Slice(Float32)
    raise ArgumentError.new("Arrays must have the same size") if a.size != b.size
    raise ArgumentError.new("Array size must be a multiple of 8") if a.size % 8 != 0

    result = Slice(Float32).new(a.size)

    # Process 8 elements at a time
    (0...a.size).step(8) do |i|
      LibSIMDish.simd_div(a.to_unsafe + i, b.to_unsafe + i, result.to_unsafe + i)
    end

    result
  end
end
