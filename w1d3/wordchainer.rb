require 'set'

class WordChainer
  attr_reader :all_seen_words

  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.readlines(dictionary_file_name).map(&:chomp))
  end

  def adjacent_words(word)
    adj_words = []
    (0...word.length).each do |i|
      start_s, end_s = word[0...i], word[(i + 1)..-1]
      ('a'..'z').each do |char|
        potential_word = start_s + char + end_s
        if char != word[i] && @dictionary.include?(potential_word)
          adj_words << potential_word
        end
      end
    end
    adj_words
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }
    until @current_words.empty? || @all_seen_words.key?(target)
      explore_current_words
    end
    pretty_path(build_path(target))
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adj_word|
        unless @all_seen_words.key?(adj_word)
          new_current_words << adj_word
          @all_seen_words[adj_word] = current_word
        end
      end
    end
    @current_words = new_current_words
  end

  def build_path(target)
    if @all_seen_words.key?(target)
      next_word = target
      path = [target]
      while @all_seen_words[next_word]
        path << @all_seen_words[next_word]
        next_word = @all_seen_words[next_word]
      end
      return path
    else
      return "no path"
    end
  end

  def pretty_path(path)
    path.reverse.join(" => ")
  end
end



if __FILE__ == $0
  w = WordChainer.new('dictionary.txt')
  #puts w.run("market", "barker")
  #p w.all_seen_words
  p w.adjacent_words("cat")
end
