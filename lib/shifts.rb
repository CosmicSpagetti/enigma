class Shifts
  attr_reader :key,
              :date
  def initialize(key = Key.new, date = Offset.new)
    @key = key.class == String ? Key.new(key) : key
    @date = date.class == String ? Offset.new(date) : date
  end

  def final_shifts(key, date)
    final_hash = {}
    final_hash[:A] =
    final_hash[:B] =
    final_hash[:C] =
    final_hash[:D] =
    final_hash
  end

end
