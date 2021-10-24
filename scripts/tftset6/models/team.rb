require './scripts/tftset6/set6'

class Team
  attr_accessor :units, :size
  attr_reader :synergies

  def initialize(units)
    @synergies = {}
    @units = units
    @units.each do |unit|
      add_synergy(unit)
    end
    @size = @units.reduce(0) { |sum, unit| sum + unit.slots }
  end

  def no_duplicate
    @units.uniq.length == @units.length
  end

  # return true if no synergy exists in team
  def no_synergy
    Set6.traits.each do |trait|
      level = @synergies[trait.id]
      return false if trait.levels.include?(level)
    end
    true
  end

  def to_s
    "Team size: #{@size} || #{@units.inspect} || #{@synergies}"
  end

  private

  def add_synergy(unit)
    unit.trait_ids.each do |trait_id|
      @synergies[trait_id] ||= 0
      @synergies[trait_id] += 1
    end
  end
end
