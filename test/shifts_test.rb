require_relative 'test_helper'

class ShiftsTest < Minitest::Test

  def test_it_exists
    shifts = Shifts.new("02715", "040895")

    assert_instance_of Shifts, shifts
  end

  def test_it_has_attributes
    shifts = Shifts.new("02715", "040895")

    assert_instance_of Key, shifts.key
    assert_instance_of Offset, shifts.date
    assert_equal "02715", shifts.key.key
    assert_equal "040895", shifts.date.date
    assert_equal 27, shifts.alphabet.count
  end

  def test_it_can_have_random_key_and_todays_date_with_no_input
    shifts = Shifts.new

    assert_instance_of Key, shifts.key
    assert_instance_of Offset, shifts.date
  end


  def test_can_get_final_shifts
    shifts = Shifts.new("02715", "040895")
    key =
    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }
    assert_equal expected, shifts.final_shifts
  end

  def test_can_apply_shifts_to_phrase
    shifts = Shifts.new("02715", "040895")

    assert_equal "keder ohulw!", shifts.shifter("Hello World!")
  end



end
