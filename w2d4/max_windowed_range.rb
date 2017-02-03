def naive(array, window_size)
  current_max_range = nil
  (0..array.length - window_size).each do |i|
    max = array[i..i + window_size - 1].max
    min = array[i..i + window_size - 1].min
    if current_max_range == nil || max - min > current_max_range
      current_max_range = max - min
    end
  end
  current_max_range
end

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.dup.first
  end

  def size
    @queue.length
  end

  def empty?
    @queue.empty?
  end
end

class MyStack
  def initialize
    @stack = []
    @maxes = []
    @mins = []
  end

  def push(el)
    @maxes << el if @maxes.empty? || el > @maxes.last
    @mins << el if @mins.empty? || el < @mins.last
    @stack << el
    el
  end

  def pop
    @maxes.pop if @maxes.last == @stack.last
    @mins.pop if @mins.last == @stack.last
    @stack.pop
  end

  def peek
    @stack.dup.last
  end

  def size
    @stack.length
  end

  def empty?
    @stack.empty?
  end

  def max
    @maxes.last
  end

  def min
    @mins.last
  end
end

class StackQueue
  def initialize
    @push_stack = MyStack.new
    @pop_stack = MyStack.new
  end

  def enqueue(element)
    until @pop_stack.empty?
      @push_stack.push(@pop_stack.pop)
    end

    @push_stack.push(element)
    element
  end

  def dequeue
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end

    @pop_stack.pop
  end

  def size
    @pop_stack.size + @push_stack.size
  end

  def empty?
    @pop_stack.empty? && @push_stack.empty?
  end

  def max
    @push_stack.max || @pop_stack.max
  end

  def min
    @push_stack.min || @pop_stack.min
  end

end

def wmr(array, window_size)
  copy = array.dup
  max_range = 0
  queue = StackQueue.new

  until queue.size == window_size
    queue.enqueue(copy.pop)
  end

  until copy.empty?
    queue_range = queue.max - queue.min
    max_range = queue_range if queue_range > max_range

    queue.dequeue
    queue.enqueue(copy.pop)
  end

  max_range
end





#
p wmr([1, 0, 2, 5, 4, 8], 2) # 4, 8
p wmr([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p wmr([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p wmr([1, 3, 2, 5, 4, 8], 5)
