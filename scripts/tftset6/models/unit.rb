class Unit
  attr_accessor :id, :name, :trait_ids, :slots

  def initialize(id, name, trait_ids, slots = 1)
    @id = id
    @name = name
    @trait_ids = trait_ids
    @slots = slots
  end

  def eql?(other)
    @id == other.id
  end

  def to_s
    "#{@name}"
  end

  def inspect
    "#{@name}"
  end
end
