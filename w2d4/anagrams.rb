require "byebug"

def first_anagram?(string1, string2)
  string1_anagrams = string1.split("").permutation.map { |el| el.join("") }

  string1_anagrams.include?(string2)
end

def second_anagram?(string1, string2)
  until string1.empty? || string2.empty?
    string2_idx = string2.index(string1[0])
    return false if string2_idx.nil?
    string1[0] = ""
    string2[string2_idx] = ""
  end
  string1 == string2
end

def third_anagram?(string1, string2)
  string1 = string1.split("").sort
  string2 = string2.split("").sort
  string1 == string2
end

def fourth_anagram?(string1, string2)
  letters = Hash.new(0)

  string1.each_char do |char|
    letters[char] += 1
  end

  string2.each_char do |char|
    letters[char] -= 1
  end

  letters.values.uniq == [0]
end

p fourth_anagram?("elvis", "velis")
