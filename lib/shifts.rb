class Shifts
  attr_reader :key,
              :date
  def initialize(key = Key.new, date = Offset.new)
    @key = key.class == String ? Key.new(key) : key
    @date = date.class == String ? Offset.new(date) : date
  end

  def final_shifts
    final_hash = {}
    final_hash[:A] = @key.key_hash[:a_key] + @date.offset[:a_offset]
    final_hash[:B] = @key.key_hash[:b_key] + @date.offset[:b_offset]
    final_hash[:C] = @key.key_hash[:c_key] + @date.offset[:c_offset]
    final_hash[:D] = @key.key_hash[:d_key] + @date.offset[:d_offset]
    final_hash
  end

end
