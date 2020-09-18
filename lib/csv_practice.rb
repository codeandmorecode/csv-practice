require "csv"
require "awesome_print"

# WAVE 1 - READING FROM A CSV AND TRANSFORMING THE DATA
# PART 1
def get_all_olympic_athletes(filename)

  olympic_medalists = CSV.read(filename, headers: true).map do |olympic_medalist|
    { "ID" => olympic_medalist["ID"],
        "Name" => olympic_medalist["Name"],
        "Height" => olympic_medalist["Height"],
        "Team" => olympic_medalist["Team"],
        "Year" => olympic_medalist["Year"],
        "City" => olympic_medalist["City"],
        "Sport" => olympic_medalist["Sport"],
        "Event" => olympic_medalist["Event"],
        "Medal" => olympic_medalist["Medal"]
    }
  end

  return olympic_medalists

end
# COMMENT: WHEN I REMOVE THE "C:/Users/alice/ADA/csv-practice/" PORTION OF THE FILENAME, IT GIVES ME AN ERROR
# result_array_part1 = get_all_olympic_athletes("data/athlete_events.csv")

# PART 2
def total_medals_per_team(olympic_data)

  team_medals_hash = {}

  olympic_data.each do |data|

    if team_medals_hash.key?(data["Team"])
      if ["Gold", "Silver", "Bronze"].include?(data["Medal"]) #SAME TEAM, MEDAL
        team_medals_hash[data["Team"]] += 1
      end
    else

      if ["Gold", "Silver", "Bronze"].include?(data["Medal"]) # NEW TEAM, MEDAL
        team_medals_hash[data["Team"]] = 1
      else
        team_medals_hash[data["Team"]] = 0

      end
    end
  end
  return team_medals_hash
end

#
#
#
#
#
#
#
#
#
#
#
#
#
#
# #total_medals_per_team(result_array_part1)
# #----------------------------------------------------------------------
# #WAVE 2 (OPTIONAL)- TRANSFORMING, FILTERING, OR MAPPING DATA FROM A CSV
#
# #def get_all_gold_medalists(olympic_data)
# #end
#
# #----------------------------------------------------------------------