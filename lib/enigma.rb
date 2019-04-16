class Enigma

  def encrypt(message, key = Key.new, date = Offset.new)
    shifts = Shifts.new(key, date)
    { encryption:shifts.shifter(message) ,
      key: shifts.key_instance.key ,
      date: shifts.date_instance.date }
  end

  def decrypt(message, key = Key.new, date = Offset.new)
    shifts = Shifts.new(key, date)
    { decryption:shifts.deshifter(message) ,
      key: shifts.key_instance.key ,
      date: shifts.date_instance.date }
  end

  def crack(message, date = Offset.new)
    key = 00000
    key_format = key.to_s.rjust(5, "0")
    cracked_message = decrypt(message, key_format, date)
    until cracked_message[:decryption][-4..-1] == " end"
      key += 1
      key_format = key.to_s.rjust(5, "0")
      cracked_message = decrypt(message, key_format, date)
    end
    decrypt(message, key_format, date)
  end

end
