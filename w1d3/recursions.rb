def range(start_num, end_num)
  return [] if end_num < start_num
  return [start_num] if start_num == end_num

  [start_num].concat(range(start_num + 1, end_num))
end

def recursive_sum(nums_array)
  return 0 if nums_array.length == 0
  nums_array[0] + recursive_sum(nums_array[1..-1])
end

def iterative_sum(nums_array)
  sum = 0
  nums_array.each { |num| sum += num }
  sum
end

def exponentiation_1(base, power)
  return 1 if power == 0

  base * exponentiation_1(base, power - 1)
end

def exponentiation_2(base, power)
  return 1 if power == 0
  return base if power == 1

  if power % 2 == 0
    exponentiation_2(base, power / 2) ** 2
  else
    base * (exponentiation_2(base, (power-1) / 2)**2)
  end
end

class Array
  def deep_dup
    copy = []
    self.each do |el|
      if el.is_a? Array
        copy << el.deep_dup
      else
        copy << el
      end
    end
    copy
  end
end

def recursive_fib(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  previous_fib = recursive_fib(n-1)
  previous_fib << previous_fib[-1] + previous_fib[-2]
end

def iterative_fib(n)
  return [0] if n == 1
  fibs_to_n = [0, 1]
  (n-2).times { fibs_to_n << fibs_to_n[-1] + fibs_to_n[-2] }
  fibs_to_n
end

def permutations(arr)
  return [arr] if arr.length <= 1
  perms = []
  arr.each_with_index do |el, idx|
    new_array = permutations(arr[0...idx] + arr[idx+1..-1]).map do |perm|
      perm.unshift(el)
    end
    new_array.each { |a| perms << a }
  end
  perms
end

def bsearch(array, target)
  return nil if array.length == 1 && target != array[0]

  mid = array.length/2
  return mid if target == array[mid]
  if target > array[mid]
    b = bsearch(array[mid+1..-1], target)
    b ? b + mid + 1 : b
  else
    bsearch(array[0...mid], target)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  left = arr[0...arr.length/2]
  right = arr[arr.length/2..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(arr1, arr2)
  merged = []

  until arr1.empty? || arr2.empty?
    if arr1[0] > arr2[0]
      merged << arr2.shift
    else
      merged << arr1.shift
    end
  end

  [*arr1, *arr2].each { |el| merged << el }

  merged
end

def greedy_make_change(amount, coins)
  return [] if amount == 0
  coins.each do |coin|
    if coin <= amount
        return [coin] + greedy_make_change(amount - coin, coins)
    end
  end
end

def make_better_change(amount, coins)
  return [] if amount == 0
  shortest_change = nil
  coins.each do |coin|
    if coin <= amount
      new_coins = coins.select { |other_coin| coin >= other_coin }
      subchange = make_better_change(amount - coin, new_coins)
      if subchange && (shortest_change.nil? || shortest_change.length > subchange.length + 1)
        shortest_change = [coin] + subchange
      end
    end
  end
  shortest_change
end
