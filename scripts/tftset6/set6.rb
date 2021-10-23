require 'json'

require_relative 'models/trait'
require_relative 'models/unit'

class Set6
  class << self
    attr_accessor :units, :traits, :trait_ids
    attr_accessor :trait_map # trait_id => [Unit] hash

    def init
      parse_units
      parse_traits
      init_trait_map
    end

    def parse_units
      file = File.open './data/set6/champions.json'
      data = JSON.load file
      file.close

      @units = []
      data.each do |obj|
        slots = obj['slots'] || 1
        unit = Unit.new(obj['id'], obj['name'], obj['traits'], slots)
        @units.push(unit)
      end
    end

    def parse_traits
      file = File.open './data/set6/traits.json'
      data = JSON.load file
      file.close

      @traits = []
      @trait_ids = []
      data.each do |obj|
        trait = Trait.new(obj['id'], obj['name'], obj['levels'])
        @traits.push(trait)
        @trait_ids.push(obj['id'])
      end
    end

    def init_trait_map
      # First create keys for hash
      trait_ids = @traits.map { |trait| trait.id }
      @trait_map = Hash[trait_ids.collect { |id| [id, Array.new] }]

      # Populate each value with corresponding Units
      @units.each do |unit|
        unit.trait_ids.each do |id|
          @trait_map[id].push(unit)
        end
      end
    end
  end
end
