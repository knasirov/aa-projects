#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return 0 if array.length == 0
  array.pop + sum_recur(array)
end

# puts sum_recur([1, 2, 3, 4])
# puts sum_recur([1, -5, -23334])
# puts sum_recur([])

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array.length == 0
  array[0] == target || includes?(array[1..-1], target)
end

# puts includes?([1, 2, 3, 4], 3)
# puts includes?([1, 2, 3, 4], 6)

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.empty?
  (array.first == target ? 1 : 0) + num_occur(array[1..-1], target)
end

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.length < 2
  return array[0] + array[1] == 12 if array.length == 2

  array[0] + array[1] == 12 || add_to_twelve?(array[1..-1])
end

# p add_to_twelve?([4, 8, 4, 7, 3, 9, 4])
# p add_to_twelve?([3, 7, 0])

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return true if array.length < 2
  array[0] <= array[1] && sorted?(array[1..-1])
end

# p sorted?([6, 5])
# p sorted?([1, 4, 8, 10])

# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length == 1
  string[-1] + reverse(string[0..-2])
end

# puts reverse("khalil")
# puts reverse("terry")
