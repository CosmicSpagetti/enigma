class Key
  attr_reader :key

  def initialize(key = rand.to_s[2..6])
    @key = key
  end


end
