require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  # def inspect
  #   @key.inspect
  #   @value.inspect
  #   @next.inspect
  #   # @prev.inspect
  # end
  def inspect
  { 'key' => @key, 'val'=> @val, 'next' => @next }.inspect
end

    def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev.object_id == @head.object_id
  end

  def get(key)


  end

  def include?(key)
  end

  def insert(key, val)
    new_link = Link.new(key, val)

    if self.empty?
      new_link.prev = @head
    else
      new_link.prev = self.last
    end

    new_link.next = @tail
    new_link.next.prev = new_link
    new_link.prev.next = new_link
  end

  def remove(key)

  end

  def each
    self.length.times do |link|
      unless link == @head || link == @tail
        yield link
      end
    end

  end

  ## start at head, counter that increments each loop, until tail



  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
#
# our_linked_list = LinkedList.new
# p our_linked_list
# our_linked_list.insert(2, 4)
# our_linked_list.insert(40, 50)
# our_linked_list.insert(60, 70)
# p our_linked_list.head.next
