require 'pry'

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

end

class LinkedList
  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    tail = Node.new(value)
    @tail.next_node = tail if @tail
    @tail = tail
    @head = tail if self.empty?
    @size += 1
  end

  def prepend(value)
    head = Node.new(value)
    head.next_node = @head if @head
    @head = head
    @size += 1
  end

  def size
    return @size
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def at(index)
    return @head if index == 0
    return @tail if index == self.size-1
    search = @head
    index.times do
      return "No such index" unless search.next_node
      search = search.next_node
    end
    return search
  end

  def pop
    pop = @tail
    case self.size
    when 0
      return "List is empty"
    when 1
      @head = nil
      @tail = nil
      @size = 0
      return pop
    else
      new_tail = self.at(self.size-2)
      new_tail.next_node = nil
      @tail = new_tail
      @size -= 1
      return pop
    end
  end

  def find(data)
    return @size-1 if @tail.value == data
    search = @head
    count = 0
    while search.next_node
      return count if search.value == data
      count += 1
      search = search.next_node
    end
    return nil
  end

  def to_s
    if @head.nil?
      puts "List is empty"
      return
    end
    search = @head
    while search.next_node
      print "#{search.value} -> "
      search = search.next_node
    end
    print "#{@tail.value} -> (nil)"
  end

  def insert_at(data, index)
    case index
    when 0 then self.prepend(data)
    when @size-1 then self.append(data)
    else
      previous_node = self.at(index-1)
      following_node = self.at(index)
      node = Node.new(data)
      previous_node.next_node = node
      node.next_node = following_node
      @size += 1
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
      size -= 1
      return @head
    elsif index == @size-1
      self.pop()
    else
      previous_node = self.at(index-1)
      following_node = self.at(index+1)
      previous_node.next_node = following_node
      @size -= 1
    end
  end

  def empty?
    return true if @size == 0
    return false
  end
end

list = LinkedList.new
list.append('a')
list.append('b')
list.append('c')
list.append('d')
list.append('e')
list.append('f')


binding.pry
