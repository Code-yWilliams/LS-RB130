class Verse
  attr_reader :bottle_count

  def initialize(bottle_count)
    @bottle_count = bottle_count
  end

  def output
    first, second, third = if bottle_count == 2
                             ["2 bottles", "Take one down and pass it around", "1 bottle"]
                           elsif bottle_count == 1
                             ["1 bottle", "Take it down and pass it around", "no more bottles"]
                           elsif bottle_count == 0
                             ["No more bottles", "Go to the store and buy some more", "99 bottles"]
                           else
                             ["#{bottle_count} bottles", "Take one down and pass it around", "#{bottle_count-1} bottles"]
                           end
    <<~WWW
    #{first} of beer on the wall, #{first.downcase} of beer.
    #{second}, #{third} of beer on the wall.
    WWW
  end
end

class BeerSong
  def self.lyrics
    output = []
    99.downto(0) { |num| output << Verse.new(num).output }
    output.join("\n")
  end

  def self.verses(first, last)
    output = []
    first.downto(last) { |num| output << Verse.new(num).output }
    output.join("\n")
  end

  def self.verse(n)
    Verse.new(n).output
  end
end
