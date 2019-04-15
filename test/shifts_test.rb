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
    expected = [3,27,73,20]
    assert_equal expected, shifts.final_shifts
  end

  def test_can_encrypt_messages
    shifts = Shifts.new("02715", "040895")
    assert_equal "keder ohulw!", shifts.shifter("Hello World!")
  end

  def test_can_decrypt_messages
    shifts = Shifts.new("02715", "040895")

    assert_equal "hello world!", shifts.deshifter("keder ohulw!")
  end

  def test_can_rotate_key
    shifts = Shifts.new("02715", "040895")

    assert_equal 3, shifts.current_key
    assert_equal 27, shifts.current_key
    assert_equal 73, shifts.current_key
    assert_equal 20, shifts.current_key
    assert_equal 3, shifts.current_key
  end
  

end
