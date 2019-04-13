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

end

# The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.
#
# The encrypt method returns a hash with three keys:
#
# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY
