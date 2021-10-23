class Trait
  attr_accessor :id, :name, :levels

  def initialize(id, name, levels)
    @id = id
    @name = name
    @levels = levels
  end

  def to_s
    @name
  end
end
