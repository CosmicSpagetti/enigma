class Shifts
  attr_reader :key_instance,
              :date_instance,
              :alphabet,
              :final_values
  def initialize(key = Key.new, date = Offset.new)
    @key_instance = key.class == String ? Key.new(key) : key
    @date_instance = date.class == String ? Offset.new(date) : date
    @alphabet = ("a".."z").to_a << " "
    @final_values = final_shifts
  end

  def final_shifts
    final = []
    final << @key_instance.key_hash[:a_key] + @date_instance.offset[:a_offset]
    final << @key_instance.key_hash[:b_key] + @date_instance.offset[:b_offset]
    final << @key_instance.key_hash[:c_key] + @date_instance.offset[:c_offset]
    final << @key_instance.key_hash[:d_key] + @date_instance.offset[:d_offset]
    final
  end

  def current_key
    key = @final_values.first
    @final_values.rotate!
    key
  end

  def shifter(message)
    message.downcase.chars.map do |char|
      char.tr(@alphabet.to_s, @alphabet.rotate(current_key).to_s)
    end.join
  end

  def deshifter(message)
   message.downcase.chars.map do |char|
     char.tr(@alphabet.to_s, @alphabet.rotate(-current_key).to_s)
   end.join
  end
end
