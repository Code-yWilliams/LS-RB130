class SumOfMultiples
  attr_reader :multiples_of, :multiples

  def initialize(*multiples_of)
    @multiples_of = multiples_of == [] ? [3, 5] : multiples_of
    @multiples = [0]
  end

  def to(num)
    multiples_of.each do |multiple_of|
      multiple_of.step(num - 1, multiple_of) do |multiple|
        @multiples << multiple
      end
    end

    multiples.uniq.inject(&:+)
  end

  def self.to(num)
    n = SumOfMultiples.new()
    n.to(num)
  end
end
