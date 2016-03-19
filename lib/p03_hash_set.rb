require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets

    mod = num.hash % num_buckets

    unless @store[mod].include?(num)
      @store[mod] << num
      @count += 1
    end
  end

  def remove(num)
    mod = num.hash % @store.length
    @store[mod].delete(num) if @store[mod].include?(num)
  end

  def include?(num)
    mod = num.hash % @store.length
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
