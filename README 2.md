# tft-traits


# Methods

## Brute force
choose 1 unit, then try got for the possible n unit combinations
there are a total of 58 units not including Veigar (which we will omit due to its synergy)
we can also omit units with single synergies

use memoization since we can keep a list of units that don't have synergies

def least_traits(team_size)

def no_synergy(new_unit, team)
  return if bigger than specified team size
  loop through and check if synergy or same unit
  if not, return new array appended

memo = [teams of just 1 unit]

for i=0 in memo
  for j in all_units
    call no_synergy
      if true, add new combined team to memo
