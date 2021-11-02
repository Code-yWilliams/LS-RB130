class DNA
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    shorter, longer = [sequence.chars, other_sequence.chars].sort_by(&:size)
    distance = 0
    shorter.each_with_index do |char, index|
      distance += 1 unless char == longer[index]
    end
    distance
  end
end



