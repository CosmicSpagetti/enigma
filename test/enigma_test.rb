require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end


  def test_can_encrypt_message
    enigma = Enigma.new
    expected = {
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
     }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_can_encrypt_using_todays_date
    enigma = Enigma.new
    expected = {
       encryption: "ojhavesdyq ",
       key: "02715",
       date: "140419"
     }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

end
