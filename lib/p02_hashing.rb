class Fixnum
  # Fixnum#hash already implemented for you
  self.hash
end

class Array
  def hash
    return -3869994594647549572 if self.empty?

    answer = []
    self.each.with_index do |el, idx|
      answer << (el.hash ^ idx.hash)
    end

    current_hash = nil
    (answer.length).times do |num|
      if num == 0
        current_hash = answer[num].hash ^ answer[num + 1].hash
      elsif num == 1
        next
      else
        current_hash = current_hash ^ answer[num].hash
      end
    end

    current_hash
  end
end

class String
  def hash

    num_letters = Hash[('a'..'z').zip((0..25).to_a)]

    nums = self.chars.map do | char |
      num_letters[char]
    end

    nums.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashy = self.to_a.sort.flatten
    hashy.hash

  end
end
