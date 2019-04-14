require_relative 'test_helper'

class ShiftsTest < Minitest::Test

  def test_it_exists
    binding.pry
    shifts = Shifts.new("02715", "040895")

    assert_instance_of Shifts, shifts
  end

  def test_it_has_attributes
    shifts = Shifts.new("02715", "040895")
    assert_instance_of Key, shifts.key
    assert_instance_of Offset, shifts.date
    assert_equal "02715", shifts.key.key
    assert_equal "040895", shifts.date.date
  end

  def test_it_can_have_random_key_and_todays_date_with_no_input
    shifts = Shifts.new


  end


  # def test_can_get_final_shifts
  #   shifts = Shifts.new
  #   key =
  #   expected = {
  #     A: 3,
  #     B: 27,
  #     C: 73,
  #     D: 20
  #   }
  #   assert_equal expected, shifts.final_shifts(key, date)
  # end
end