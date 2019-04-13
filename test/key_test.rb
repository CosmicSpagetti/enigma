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

  # def test_can_get_5_digit_key_random_key
  #   key = Key.new
  #
  #
  # end


end
