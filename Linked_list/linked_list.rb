# Node initializer

class Node
  attr_accessor :next, :value

  def initialize(value, next_n)
    @value = value
    @next  = next_n
  end
end

# Linked list
class LinkedList
  def initialize(value)
    @head = Node.new(value, nil)
    # @tail = nil
  end

  def insert(value)
    current_node = @head
    current_node = current_node.next until current_node.next.nil?
    current_node.next = Node.new(value, nil)
  end

  def find(value)
    current_node = @head
    puts current_node.value
    return false unless current_node.next
    return current_node.next if current_node.value == value

    while (current_node = current_node.next)
      return current_node.next if current_node.value == value
    end
  end

  def print_list
    current_node = @head
    #puts current_node.value
    while (current_node = current_node.next)
      puts current_node.value
    end
  end

  def deletion(value)
    current_node = @head
    if current_node.value == value
      @head = current_node.next
    else
      while (current_node.next != nil) && (current_node.next.value != value)
        if (current_node.next == nil) || (current_node.next.value == value)
          current_node.next = current_node.next.next
        else
          current_node = current_node.next
        end
      end
      current_node.next = current_node.next.next
    end
  end
end


y = LinkedList.new(1)
y.print_list