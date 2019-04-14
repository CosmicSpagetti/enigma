class Offset
  attr_reader :date,
              :offset
  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
    @offset = create_offset
  end

  def offset_number
    (@date.to_i ** 2).to_s.chars.last(4).join
  end

  def create_offset
    offset_hash = {}
    offset_hash[:a_offset] = offset_number[0].to_i
    offset_hash[:b_offset] = offset_number[1].to_i
    offset_hash[:c_offset] = offset_number[2].to_i
    offset_hash[:d_offset] = offset_number[3].to_i
    offset_hash
  end

end
