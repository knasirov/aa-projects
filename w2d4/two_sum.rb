require "byebug"
def bad_two_sum?(array, target)
  (0 ... array.length - 1).each do |i|
    (i + 1 ... array.length).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
end

def okay_two_sum?(array, target)

  copy = array.sort

  (0 ... copy.length).each do |i|

    result = copy[i + 1 .. -1].bsearch do |el|
      el >= target - copy[i]
    end

    return true if result != nil && result + copy[i] == target
  end

  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10)

def two_sum?(array, target)

  target_diff = Hash.new

  array.each do |el|
    target_diff[el] = target - el
  end

  target_diff.each do |key, value|
    return true unless target_diff[value].nil? || key == value
  end

  false

end
#
# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10)
