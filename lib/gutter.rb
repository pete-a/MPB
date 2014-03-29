class Gutter
  attr_accessor :key, :value

  def initialize(hash)
    @key = hash.keys.first
    @value = hash[@key]
  end

end
