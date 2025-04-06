require "./spec_helper"

describe SIMDish do
  describe ".add" do
    it "adds two Float32 arrays using SIMD" do
      a = Slice[1.0_f32, 2.0_f32, 3.0_f32, 4.0_f32, 5.0_f32, 6.0_f32, 7.0_f32, 8.0_f32]
      b = Slice[8.0_f32, 7.0_f32, 6.0_f32, 5.0_f32, 4.0_f32, 3.0_f32, 2.0_f32, 1.0_f32]

      result = SIMDish.add(a, b)

      expected = Slice[9.0_f32, 9.0_f32, 9.0_f32, 9.0_f32, 9.0_f32, 9.0_f32, 9.0_f32, 9.0_f32]
      result.should eq(expected)
    end

    it "adds larger arrays (multiple of 8)" do
      a = Slice(Float32).new(16) { |i| i.to_f32 }
      b = Slice(Float32).new(16) { |i| (16 - i).to_f32 }

      result = SIMDish.add(a, b)

      expected = Slice(Float32).new(16, 16.0)
      result.should eq(expected)
    end

    it "raises an error if arrays have different sizes" do
      a = Slice(Float32).new(8)
      b = Slice(Float32).new(16)

      expect_raises(ArgumentError, "Arrays must have the same size") do
        SIMDish.add(a, b)
      end
    end

    it "raises an error if array size is not a multiple of 8" do
      a = Slice(Float32).new(10)
      b = Slice(Float32).new(10)

      expect_raises(ArgumentError, "Array size must be a multiple of 8") do
        SIMDish.add(a, b)
      end
    end
  end

  describe ".sub" do
    it "subtracts two Float32 arrays using SIMD" do
      a = Slice[10.0_f32, 20.0_f32, 30.0_f32, 40.0_f32, 50.0_f32, 60.0_f32, 70.0_f32, 80.0_f32]
      b = Slice[1.0_f32, 2.0_f32, 3.0_f32, 4.0_f32, 5.0_f32, 6.0_f32, 7.0_f32, 8.0_f32]

      result = SIMDish.sub(a, b)

      expected = Slice[9.0_f32, 18.0_f32, 27.0_f32, 36.0_f32, 45.0_f32, 54.0_f32, 63.0_f32, 72.0_f32]
      result.should eq(expected)
    end
  end

  describe ".mul" do
    it "multiplies two Float32 arrays using SIMD" do
      a = Slice[1.0_f32, 2.0_f32, 3.0_f32, 4.0_f32, 5.0_f32, 6.0_f32, 7.0_f32, 8.0_f32]
      b = Slice[8.0_f32, 7.0_f32, 6.0_f32, 5.0_f32, 4.0_f32, 3.0_f32, 2.0_f32, 1.0_f32]

      result = SIMDish.mul(a, b)

      expected = Slice[8.0_f32, 14.0_f32, 18.0_f32, 20.0_f32, 20.0_f32, 18.0_f32, 14.0_f32, 8.0_f32]
      result.should eq(expected)
    end
  end

  describe ".div" do
    it "divides two Float32 arrays using SIMD" do
      a = Slice[8.0_f32, 16.0_f32, 24.0_f32, 32.0_f32, 40.0_f32, 48.0_f32, 56.0_f32, 64.0_f32]
      b = Slice[2.0_f32, 2.0_f32, 3.0_f32, 4.0_f32, 5.0_f32, 6.0_f32, 7.0_f32, 8.0_f32]

      result = SIMDish.div(a, b)

      expected = Slice[4.0_f32, 8.0_f32, 8.0_f32, 8.0_f32, 8.0_f32, 8.0_f32, 8.0_f32, 8.0_f32]
      result.should eq(expected)
    end
  end
end
