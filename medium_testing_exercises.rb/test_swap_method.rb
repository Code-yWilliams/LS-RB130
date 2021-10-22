require "minitest/autorun"
require_relative "text"

class SwapMethodTest < MiniTest::Test

  def setup
    @file = File.open("sample_text.txt")
    @text = Text.new(@file.read)
  end

  def test_swap
    expected_output = <<~FFF.strip
    Oorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum. 
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat 
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo 
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum 
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras 
    et varius mauris, at pharetra mi.
    FFF

    assert_equal(expected_output, @text.swap("L", "O"))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    
  end


end