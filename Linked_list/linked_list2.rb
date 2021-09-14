class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    value.to_s
  end
end

class LinkedList
  attr_accessor :size, :head, :tail

  def initialize
    self.size = 0
    self.head = nil
    self.tail = nil
  end

  def add(value)
    node = Node.new(value)
    if tail
      tail.next_node = node
    else
      self.head = node
    end

    self.tail = node
    self.size += 1
    node
  end

  def at(index)
    return nil if (index + 1) > size || index.negative?

    pointer = head
    index.times do
      pointer = pointer.next_node
    end

    pointer
  end

  def find(value)
    size.times do |i|
      return i if at(i).value == value
    end

    nil
  end

  def to_s
    return nil unless head

    pointer = head

    while pointer
      print "#{pointer} -> "
      pointer = pointer.next_node
    end

    puts 'nil'
  end

  def remove_at(index)
    return nil if index.negative? || index >= size

    to_remove = at(index)
    if index.zero?
      self.head = to_remove.next_node
    else
      at(index - 1).next_node = to_remove.next_node
      self.tail = at(index - 1) if tail == to_remove
    end
    self.size -= 1
    to_remove
  end

  def get(index)
    return nil if index.negative? || index >= size

    at(index)
  end
end
