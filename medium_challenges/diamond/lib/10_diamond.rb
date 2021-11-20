class Diamond
  @@letters = ("A".."Z").to_a.freeze

  def self.make_diamond(letter)
    lines = []
    max_index = @@letters.index(letter.upcase)
    max_width = max_index + (max_index + 1)
    if letter.upcase == "A"
      lines << "A".center(max_width)
    else
      0.upto(max_index) do |index|
        if index == 0
          lines << "A".center(max_width)
        else
          lines << (@@letters[index] + (" " * (index + index - 1)) + @@letters[index]).center(max_width)
        end
      end
      (max_index - 1).downto(0) do |index|
        if index == 0
          lines << "A".center(max_width)
        else
          lines << (@@letters[index] + (" " * (index + index - 1)) + @@letters[index]).center(max_width)
        end
      end
    end
    lines.join("\n") + "\n"
  end
end

puts Diamond.make_diamond("C")

