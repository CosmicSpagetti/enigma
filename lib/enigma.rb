class Enigma

  def encrypt(message, key = Key.new, date = Offset.new)
    shifts = Shifts.new(key, date)
    encrypt_hash = {
      encryption:shifts.shifter(message) ,
      key: shifts.key.key ,
      date: shifts.date.date
    }
  end

  def decrypt(message, key = Key.new, date = Offset.new)
    shifts = Shifts.new(key, date)
    decrypt_hash = {
      decryption:shifts.deshifter(message) ,
      key: shifts.key.key ,
      date: shifts.date.date
    }
  end

  def crack(message, date = Offset.new)
    key = 10000000
    key_format = key.to_s[-5..-1]
    cracked_message = decrypt(message, key_format, date)
    until cracked_message[:decryption][-4..-1] == " end"
      key += 1
      key_format = key.to_s[-5..-1]
      cracked_message = decrypt(message, key_format, date)
      break if key_format == "99999"
    end
    decrypt(message, key_format, date)
  end

end
