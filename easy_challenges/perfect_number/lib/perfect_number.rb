class PerfectNumber

  def self.classify(num)
    raise StandardError if num.negative?

    divisors = []

    1.upto(num - 1) do |n|
      divisors << n if (num % n == 0)
    end

    div_sum = divisors.inject(&:+)

    type = if div_sum == num
             'perfect'
           elsif div_sum < num
             'deficient'
           else
             'abundant'
           end
    type
  end

end


