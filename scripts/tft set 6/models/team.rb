class Team
  attr_accessor :units

  @synergies = {}

  def initialize(units)
    @units = units
    @units.each do |unit|
      add_synergy(unit)
    end
  end

  def size
    @units.reduce(0) { |sum, unit| sum + unit.slots }
  end

  def no_duplicate(new_unit)
    @units.none? { |unit| unit.id == new_unit.id }
  end

  def no_synergy
    Set6.traits.each do |trait|
      level = @synergies[trait]
      return false if trait.levels.include? level
    end
    true
  end

  private

  def add_synergy(unit)
    unit.traits.each do |trait|
      @synergies[trait.id] ||= 0
      @synergies[trait.id] += 1
    end
  end
end
