# class for converting numbers to roman numeral
class RomanNumeral
  attr_reader :number

  NUMERALS = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
  }

  def initialize(integer)
    @number = integer
  end

  def to_roman
    roman = ""
    NUMERALS.each do |number, letter|
      if number <= @number
        letter_count = @number / number
        roman << (letter * letter_count)
        @number -= (letter_count * number)
      end
    end
    roman
  end
end



