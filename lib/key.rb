class Key
  attr_reader :key,
              :key_hash

  def initialize(key = rand.to_s[2..6])
    @key = key
    @key_hash = split_key
  end

  def split_key
    split_key_hash = {}
    split_key_hash[:a_key] = key.scan(/\d/)[0,2].join.to_i
    split_key_hash[:b_key] = key.scan(/\d/)[1,2].join.to_i
    split_key_hash[:c_key] = key.scan(/\d/)[2,2].join.to_i
    split_key_hash[:d_key] = key.scan(/\d/)[3,2].join.to_i
    split_key_hash
  end

end
