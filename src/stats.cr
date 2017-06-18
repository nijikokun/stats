# Core module containing common statistics methods 
module Stats
  extend self

  # Returns a `Float64` averaged value from a given `Array(Int | Float32 | Float64)`
  #
  # ```
  # Stats.mean [1,2,3,4]      # => 2.5
  # ```
  def mean(input : Array(Int | Float32 | Float64)) : Float64
    # Exit early when input is empty
    return Float64.new(0) if input.size === 0

    # Convert the size to float 64
    len = input.size.to_f64

    # Add up the numbers to get the mean
    mean = input.reduce { |acc, i| acc + i }

    # find the mean average
    return mean / len
  end

  # Returns a `Float64` median value from a given `Array(Int | Float32 | Float64)`
  #
  # ```
  # Stats.median [1,3,8,9]      # => 5.5
  # ```
  def median(input : Array(Int | Float32 | Float64)) : Float64
    return Float64.new(0) if input.size === 0
    raise Exception.new("Calculating median requires more than 1 value") if input.size === 1

    # Sort the numbers
    input = input.sort

    # Convert the size to float 64
    len = input.size

    # For even numbers we add two middle numbers
    return self.mean(input[len/2-1...len/2+1]) if len%2 === 0

    # For odd numbers we return the middle number
    return input[len/2].to_f64
  end

  # Returns the most frequent value as a `Float64` from a given `Array(Int | Float32 | Float64)`
  #
  # ```
  # Stats.mode [1,3,8,9,3]      # => 3.0
  # ```
  #
  # TODO: Use generics to return value cast to original type
  # TODO: Return multiple results on case of draw
  def mode(input : Array(Int | Float32 | Float64)) : Float64
    return Float64.new(-1) if input.size === 0

    map = {} of Int32 | Int64 | Float32 | Float64 => Int32
    mode = Float64.new(-1)
    freq = 0

    input.each_with_index do |val, i|
      map[val] += 1 if map.has_key? val
      map[val] = 1 if !map.has_key? val

      if freq < map[val]
        freq = map[val]
        mode = val.to_f64
      end
    end

    return mode
  end
end
