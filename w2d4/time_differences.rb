def bad_my_min(list)

  list.each do |first|
    smallest = true
    list.each do |second|
      smallest = false if first > second
    end
    return first if smallest
  end

end


def good_my_min(list)
  smallest = list.first

  list.each do |el|
    smallest = el if smallest > el
  end

  smallest
end

def bad_subsum(list)
  subarrays = []

  (0 .. list.length - 1).each do |i|
    (i .. list.length - 1).each do |j|
      subarrays << list[i .. j]
    end
  end

  sums = subarrays.map do |array|
    array.inject(:+)
  end

  sums.max
end

def good_subsum(list)
  largest_sum = 0
  running_sum = 0
  list.each do |el|
    if running_sum + el < 0
      running_sum = 0
    else
      running_sum += el
    end
    largest_sum = running_sum if running_sum > largest_sum
  end
  
  largest_sum
end
