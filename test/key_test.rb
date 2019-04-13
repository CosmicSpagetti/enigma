require_relative 'test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new("02715")
    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new("02715")

    assert_equal "02715", key.key
  end

  def test_can_get_5_digit_key_random_key
    key = Key.new
    binding.pry
    assert_equal 5, key.key.length
  end

  def test_can_create_keys
    key = Key.new("02715")
    expected = {
      a_key: 02,
      b_key: 27,
      c_key: 71,
      d_key: 15
    }

    assert_equal expected, key.split_key
  end


end
