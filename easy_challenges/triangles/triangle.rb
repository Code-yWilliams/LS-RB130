# frozen_string_literal: true

# class for determining whether a triangle is equilateral, isosceles, or scalene
class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    raise ArgumentError unless valid?(side1, side2, side3)

    @sides = [side1, side2, side3]
  end

  def kind
    if equilateral?
      'equilateral'
    elsif scalene?
      'scalene'
    elsif isosceles?
      'isosceles'
    end
  end

  private

  def valid?(side1, side2, side3)
    triangle = [side1, side2, side3].sort
    (triangle[0] + triangle[1] > triangle[2]) &&
      triangle.all?(&:positive?)
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    @sides.uniq.size == 2
  end

  def scalene?
    @sides.uniq.size == 3
  end
end
