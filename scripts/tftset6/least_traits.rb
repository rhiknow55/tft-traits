require_relative 'set6'
require_relative 'models/team'

class LeastTraits
  attr_accessor :test_team

  def initialize(team_size)
    @memo_teams = []
    @team_size = team_size
    Set6.init

  end

  def least_traits(team = Team.new([]))
    start_time = Time.now
    puts "Team: #{team} required"
    puts "Started calculating teams of size #{@team_size} with no traits"

    recursive_version(team, 0, @team_size - team.size)

    end_time = Time.now
    elapsed_time = end_time - start_time
    puts "Elapsed time: #{elapsed_time} seconds"
    @memo_teams
  end

  # 1 - 0.005s - 50
  # 2 - 0.05s - 1070
  # 3 - 0.57s - 12,878
  # 4 - 5s - 96,292
  # 5 - 32s - 466,592
  # 6 - 148s - 1,485,347
  # 7 - 511s - 3,090,543
  # 8 - 1243s - 4,114,057
  # 9 - 2295s - 3,365,813
  # 10 - 2098s - 1,578,656
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

  private

  def valid_team?(team)
    return false if team.size > @team_size
    return false unless team.no_duplicate
    return false unless team.no_synergy
    true
  end
end
