require "byebug"

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = num unless @store.include?(num)
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store.any? { |item| item == num}
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def include?(num)
    mod = num % num_buckets
    @store[mod].include?(num)
  end

  def insert(num)
    mod = num % num_buckets
    @store[mod] << num unless @store[mod].include?(num)
  end

  def remove(num)
    mod = num % num_buckets
    @store[mod].delete(num) if @store[mod].include?(num)
  end


  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets

    mod = num % num_buckets

    unless @store[mod].include?(num)
      @store[mod] << num
      @count += 1
    end
  end

  def remove(num)
    mod = num % @store.length
    @store[mod].delete(num) if @store[mod].include?(num)
  end

  def include?(num)
    mod = num % @store.length
    @store[mod].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
 # make temporary store var to iterate through
    new_store = Array.new(num_buckets * 2) { Array.new }

    @store.each do | bucket |
      bucket.each do | el |
        mod = el % new_store.length
        new_store[mod] << el
      end
    end
    @store = new_store
  end
end
#
# a = ResizingIntSet.new
#
# a.insert(0)
# p a.include?(0)
