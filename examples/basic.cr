require "../src/simdish"

# Create Float32 arrays with 8 elements (size must be a multiple of 8)
a = Slice[1.0_f32, 2.0_f32, 3.0_f32, 4.0_f32, 5.0_f32, 6.0_f32, 7.0_f32, 8.0_f32]
b = Slice[8.0_f32, 7.0_f32, 6.0_f32, 5.0_f32, 4.0_f32, 3.0_f32, 2.0_f32, 1.0_f32]

# SIMD addition
result_add = SIMDish.add(a, b)
puts "Addition result: #{result_add}"

# SIMD subtraction
result_sub = SIMDish.sub(a, b)
puts "Subtraction result: #{result_sub}"

# SIMD multiplication
result_mul = SIMDish.mul(a, b)
puts "Multiplication result: #{result_mul}"

# SIMD division
result_div = SIMDish.div(a, b)
puts "Division result: #{result_div}"

# Processing larger arrays (16 elements)
large_a = Slice(Float32).new(16) { |i| i.to_f32 }
large_b = Slice(Float32).new(16) { |i| (16 - i).to_f32 }

puts "\nProcessing larger arrays:"
puts "Input A: #{large_a}"
puts "Input B: #{large_b}"
puts "Addition result: #{SIMDish.add(large_a, large_b)}"
