class Array
  def my_each(&blk)
    i = 0
    while i < self.length
      blk.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&blk)
    selected = []
    self.length.times do |i|
      selected << self[i] if blk.call(self[i])
    end

    selected
  end

  def my_reject(&blk)
    rejected = []
    self.length.times do |i|
      rejected << self[i] unless blk.call(self[i])
    end

    rejected
  end

  def my_any?(&blk)
    value = false
    self.length.times do |i|
      value ||= blk.call(self[i])
    end

    value
  end

  def my_all?(&blk)
    value = true
    self.length.times do |i|
      value &&= blk.call(self[i])
    end

    value
  end

  def my_flatten
    flattened = []
    self.each do |el|
      if el.is_a?(Array)
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end

    flattened
  end

  def my_zip(*args)
    result = []
    self.each_with_index do |el, idx|
      new_array = [el]
      args.each { |arg| new_array << arg[idx] }

      result << new_array
    end

    result
  end

  def my_rotate(shift = 1)
    (shift % length).times do
      self << self.shift
    end
    self
  end

  def my_join(str = "")
    string = self.first.to_s
    self[1..-1].each { |el| string << "#{str}#{el}" }

    string
  end

  def my_reverse
    reverse = []
    (length - 1).downto(0).each { |i| reverse << self[i] }
    reverse
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    count.times do
      (count - 1).times do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    copy = self.dup
    copy.bubble_sort!(&prc)
  end

end

def factors(num)
  facs = []
  (1..num).each { |factor| facs << factor if num % factor == 0 }
  facs
end

def substrings(string)
  subs = []
  (0..string.length - 2).each do |i|
    (i...string.length).each do |j|
      subs << string[i..j] unless subs.include?(string[i..j])
    end
  end

  subs
end

def subwords(word, dictionary)
  substrings(word).select { |subword| dictionary.include?(subword) }
end
