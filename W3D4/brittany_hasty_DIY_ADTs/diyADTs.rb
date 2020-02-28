class Stack
  def initialize
    # create var to store stack here!
    @elements = []
  end

  def push(el)
    # adds an element to the stack
    @elements << el
  end

  def pop
    # removes one element from the stack
    popped = @elements[-1]
    @elements = @elements[0...-1]
    popped
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @elements.length > 0 ? @elements[-1].to_s : "The stack is empty."
  end

  def showme
    # Reference for myself so I can see what is going on
    @elements.to_s
  end
end



stack = Stack.new
puts "Testing Stack Class"
puts "full stack: " + stack.showme
puts "top item: " + stack.peek
stack.push("Doritos")
stack.push("Chips")
stack.push("Lays")
puts "full stack after adding Doritos, Chips, and Lays: " + stack.showme
puts "top item: " + stack.peek
stack.pop
stack.pop
puts "full stack after removing the first element two times: " + stack.showme
puts "top item: " + stack.peek
puts



class Queue
  def initialize
    # FIFO
    @line = []
  end

  def enqueue(el)
    @line << el
  end

  def dequeue
    @line = @line[1..-1]
  end

  def peek
    @line.length > 0 ? @line[0].to_s : "There is no line."
  end

  def showme
    # Reference for myself so I can see what is going on
    @line.to_s
  end
end



q = Queue.new
puts "Testing Queue Class"
puts q.peek
puts "Current line: " + q.showme
q.enqueue("Coca-cola")
puts "First item arrives: " + q.showme
q.enqueue("Empty Coke can")
puts "Second item arrives: " + q.showme
q.enqueue("Half full (Or half empty?) Coke can")
puts "Third item arrives: " + q.showme
puts "Looking at the first item again: " + q.peek
q.dequeue
puts "Line after letting the first item go to destination: " + q.showme
puts "New first item: " + q.peek
q.dequeue
q.dequeue
puts "The line of coke is suddenly gone: " + q.showme

puts



class Map
  def initialize
    @mapped = Hash.new
  end

  def set(key, value="Nowhere to be found")
    @mapped[key] = value
  end

  def get(key)
    @mapped[key].to_s
  end

  def delete(key)
    @mapped = @mapped.reject{|k,v| k == key}
  end

  def show
    @mapped.to_s
  end
end



map = Map.new
puts "Testing Map Class"
puts "Current map: " + map.show
map.set("House key", "In the dresser")
puts "Current map: " + map.show
puts "Grabbing the house key: " + map.get("House key")
map.delete("House key")
puts "All the keys have been taken: " + map.show
map.set("Car Keys")
puts "I misplaced my car keys, they are: " + map.get("Car Keys")
puts "Current map: " + map.show
puts
