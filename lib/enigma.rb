class Enigma

  def encrypt(message, key=nil, date = nil)
    shifts = Shifts.new(key, date)
    hash = {
      encryption:shifts.shifter(message) ,
      key: shifts.key.key ,
      date: shifts.date.date
    }
    hash
  end


end
