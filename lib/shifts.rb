class Shifts
  attr_reader :key,
              :date,
              :alphabet
  def initialize(key = Key.new, date = Offset.new)
    @key = key.class == String ? Key.new(key) : key
    @date = date.class == String ? Offset.new(date) : date
    @alphabet = ("a".."z").to_a << " "
    @final_values = final_shifts
  end

  def final_shifts
    final_hash = {}
    final_hash[:A] = @key.key_hash[:a_key] + @date.offset[:a_offset]
    final_hash[:B] = @key.key_hash[:b_key] + @date.offset[:b_offset]
    final_hash[:C] = @key.key_hash[:c_key] + @date.offset[:c_offset]
    final_hash[:D] = @key.key_hash[:d_key] + @date.offset[:d_offset]
    final_hash
  end

  def shifter(message)
    message.downcase.chars.map.with_index do |char, index|
      next char unless @alphabet.include?(char)
      if index == 0 || index % 4 == 0
        char.tr(@alphabet.to_s, @alphabet.rotate(@final_values[:A]).to_s)
      elsif index % 4 == 1
        char.tr(@alphabet.to_s, @alphabet.rotate(@final_values[:B]).to_s)
      elsif index % 4 == 2
        char.tr(@alphabet.to_s, @alphabet.rotate(@final_values[:C]).to_s)
      elsif index % 4 == 3
        char.tr(@alphabet.to_s, @alphabet.rotate(@final_values[:D]).to_s)
      end
    end.join

  end



end
