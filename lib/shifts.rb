class Shifts
  attr_reader :key,
              :date,
              :alphabet,
              :final_values
  def initialize(key = Key.new, date = Offset.new)
    @key = key.class == String ? Key.new(key) : key
    @date = date.class == String ? Offset.new(date) : date
    @alphabet = ("a".."z").to_a << " "
    @final_values = final_shifts
  end

  def final_shifts
    final = []
    final << @key.key_hash[:a_key] + @date.offset[:a_offset]
    final << @key.key_hash[:b_key] + @date.offset[:b_offset]
    final << @key.key_hash[:c_key] + @date.offset[:c_offset]
    final << @key.key_hash[:d_key] + @date.offset[:d_offset]
    final
  end

  def current_key
    key = @final_values.first
    @final_values.rotate!
    key
  end

  def shifter(message)
    message.downcase.chars.map do |char|
      next char unless @alphabet.include?(char)
      @alphabet.rotate! until @alphabet.first == char
      @alphabet.rotate!(current_key).first
    end.join
  end

  def deshifter(message)
   message.downcase.chars.map do |char|
     next char unless @alphabet.include?(char)
     @alphabet.rotate! until @alphabet.first == char
     @alphabet.rotate!(-current_key).first
   end.join
  end

end
