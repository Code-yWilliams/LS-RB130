class CustomSet
  attr_reader :set

  def initialize(array=[])
    @set = array
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set - other.set == []
  end

  def disjoint?(other)
    set - other.set == set
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(num)
    set << num unless set.include?(num)
    self
  end

  def difference(other)
    diff = set - other.set
    CustomSet.new(diff)
  end

  def intersection(other)
    intersect = set.select { |e| other.set.include?(e) }
    CustomSet.new(intersect)
  end

  def union(other)
    values = (set + other.set).uniq.sort
    CustomSet.new(values)
  end

  def ==(other)
    set == other.set
  end

  protected :set
end
