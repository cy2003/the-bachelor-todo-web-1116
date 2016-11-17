require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |cast|   #data[season] shows the info for only that season
    if cast["status"] == "Winner"
      return cast["name"].split[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season|
    season[1].each do |profile, stat| #season[1] is all the data minus the seasons. (eg.{"name":"Ashley Iaconetti","age":"26"})
      return profile["name"] if profile["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season|
    season[1].each do |profile, stat|
      if profile["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season|
    season[1].each do |profile, stat|
      if profile["hometown"] == hometown
        return profile["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  average_age = 0
  sum = 0
  data[season].each do |cast|
    sum = sum + cast["age"].to_f
    # need to change cast["age"] to a float not an integer.
    # Otherwise average_age comes out as a two digit number. (eg. "season 10" it would be 25 not 25.76)
  end
  average_age = sum / data[season].count
  average_age.round
end
