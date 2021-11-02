class Scrabble
  VALUES = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] => 2,
    ["B", "C", "M", "P"] => 3,
    ["F", "H", "V", "W", "Y"] => 4,
    ["K"] => 5,
    ["J", "X"] => 8,
    ["Q", "Z"] => 10
  }

  attr_reader :word, :characters

  def initialize(word)
    @word = word
    @characters = word ? word.upcase.split("") : word
  end

  def score
    score = 0
    return score unless word
    characters.each do |char|
      included = nil
      VALUES.each do |letters, value|
        if letters.include?(char)
          included = true
          score += value
          next
        end
      end
      return 0 unless included
    end
    score
  end

  def self.score(word)
    score = 0
    return score unless word
    word.upcase.chars.each do |char|
      included = nil
      VALUES.each do |letters, value|
        if letters.include?(char)
          included = true
          score += value
          next
        end
      end
      return 0 unless included
    end
    score
  end

end
