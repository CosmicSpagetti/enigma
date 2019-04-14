class Enigma

  def encrypt(message, key = Key.new, date = Offset.new)
    shifts = Shifts.new(key, date)
    encrypt_hash = {
      encryption:shifts.shifter(message) ,
      key: shifts.key.key ,
      date: shifts.date.date
    }
  end


end
