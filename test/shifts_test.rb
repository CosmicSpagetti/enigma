require_relative 'test_helper'

class ShiftsTest < Minitest::Test

  def test_it_exists
    shifting_letters = Shifts.new

    assert_instance_of Shifts, shifting_letters
  end

  
end
