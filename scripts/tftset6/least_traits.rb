require_relative 'set6'
require_relative 'models/team'

class LeastTraits
  def initialize(team_size)
    @memo_teams = []
    @team_size = team_size
    ::Set6.init
  end

  def least_traits(team = Team.new([]))
    puts "Started calculating teams of size #{@team_size} with no traits"
    start_time = Time.now

    recursive_version(team, 0, @team_size)
    # version1

    # puts @memo_teams
    end_time = Time.now
    elapsed_time = end_time - start_time
    puts "Elapsed time: #{elapsed_time} seconds"
    @memo_teams
    # @memo_teams.map { |team| team.size == @team_size }
  end

  # 2 - 0.05s - 1070
  # 3 - 0.57s - 12878
  # 4 - 5s - 96292
  # 5 - 32s - 466592
  # 6 - 727s - 2398188
  # 7 -
  # 8 -
  # 9 -
  # 10 -
  def recursive_version(team, left, k)
    return unless valid_team?(team)

    if k == 0
      @memo_teams.concat([team])
      return
    end

    for i in (left..Set6.units.length-1)
      unit = Set6.units[i]
      next if k < unit.slots
      new_team = Team.new([*team.units, unit])
      recursive_version(new_team, i + 1, k - unit.slots)
    end
  end

  # def version1
  #   @memo_teams = Set6.units.map { |unit| Team.new([unit]) }
  #
  #   @memo_teams.each do |team|
  #     # puts team.to_s
  #     possible_units(team).each do |unit|
  #       new_team = Team.new([*team.units, unit])
  #       if valid_team?(new_team)
  #         @memo_teams.concat([new_team])
  #       end
  #     end
  #   end
  # end

  private

  # @param team [Team]
  def valid_team?(team)
    # return false if team.size > @team_size
    # return false unless team.no_duplicate
    return false unless team.no_synergy
    true
  end

  # def possible_units(team)
  #   trait_ids = team.synergies.keys
  #   team_units = Set6.trait_map.slice(*trait_ids).values.flatten
  #   units = Set6.trait_map.values.flatten - team_units
  #   units
  # end
end
