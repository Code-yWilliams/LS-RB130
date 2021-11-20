class Robot
  @@names = []

  LETTERS = ("A".."Z").to_a.freeze
  DIGITS = (0..9).to_a.map { |digit| digit.to_s }.freeze

  attr_reader :name

  def initialize
    potential_name = nil
    loop do
      potential_name = generate_name
      break unless @@names.include?(potential_name)
    end
    @@names << potential_name
    @name = potential_name
  end

  def reset
    @@names.delete(name)
    potential_name = nil
    loop do
      potential_name = generate_name
      break unless @@names.include?(potential_name)
    end
    @@names << potential_name
    @name = potential_name
  end
  
  private

  def generate_name
    result = ""
    2.times { result << LETTERS[rand(0..25)] }
    3.times { result << DIGITS[rand(0..9)] }
    result
  end
end

