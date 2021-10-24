require_relative 'scripts/tftset6/least_traits'
require_relative 'scripts/tftset6/set6'
require_relative 'scripts/tftset6/models/team'

class Main
  class << self
    def execute(team_size)
      Set6.init
      akali = Set6.units[0]
      blitz = Set6.units[1]
      t = Team.new([akali, blitz])

      l = LeastTraits.new(team_size)
      teams = l.least_traits(t)
      puts teams
      puts teams.length
    end
  end
end
