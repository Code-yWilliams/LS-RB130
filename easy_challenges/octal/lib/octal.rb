class Octal
  OCTAL_INTEGERS = %w(0 1 2 3 4 5 6 7)

  attr_reader :octal_digits

  def initialize(octal_string)
    @octal_digits = octal_string.chars
    until @octal_digits[0] != 0
      @octal_digits.shift
    end
  end

  def to_decimal
    index = 1
    octal_digits[-index]
  end

  def valid?
    octal_digits.all? { |digit| OCTAL_INTEGERS.include?(digit) }
  end

  def to_decimal
    return 0 unless valid?

    result = 0

    power = 0

    octal_digits.reverse_each do |digit|
      digit_value = digit.to_i * (8**power)
      result += digit_value
      power += 1
    end

    result
  end
end