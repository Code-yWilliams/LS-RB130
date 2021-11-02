class Anagram
  attr_reader :word, :anagrams

  def initialize(word)
    @word = word.downcase!
    @anagrams = word.chars.permutation.to_a.map { |letters| letters.join("") }.uniq
    @anagrams.delete(word)
  end

  def match(array)
    array.select { |word| anagrams.include?(word.downcase) }
  end
end