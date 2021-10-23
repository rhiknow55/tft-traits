

module TftSet6
  class LeastTraits
    def initialize(team_size)
      @team_size = team_size
      @set6 = Set6.new
    end

    def least_traits()
      memo_teams = @set6.units

      memo_teams.each do |team|
        @set6.units.each do |unit|
          new_team = Team.new(team.units.append(unit))
          memo_teams.concat(new_team) if validate_new_team(new_team)
        end
      end
    end

    private

    # @param team [Team]
    # @returns boolean
    def validate_new_team(team)
      # create new temp team instance
      return false if team.size > @team_size
      return false unless team.no_synergy
      true
    end
  end
end
