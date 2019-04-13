require_relative 'test_helper'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new("040895")

    assert_instance_of Offset, offset
  end

  def test_it_has_date
    offset = Offset.new("040895")

    assert_equal "040895", offset.date
  end

  def test_can_get_todays_date_with_no_input
    offset = Offset.new

    assert_equal "130419", offset.date
  end

  def test_can_create_offset_from_date
    offset = Offset.new("040895")
    expected = {
      a_offset: 1,
      b_offset: 0,
      c_offset: 2,
      d_offset: 5
    }
    assert_equal expected, offset.create_offset 
  end
end
