class Unit
  attr_accessor :id, :name, :traits, :slots

  def initialize(id, name, traits, slots = 1)
    @id = id
    @name = name
    @traits = traits
    @slots = slots
  end
end
