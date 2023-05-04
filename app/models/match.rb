class Match < ApplicationRecord
  
  def title
    return Team.find_by(teamName: frontTeam).teamName + " V/S " + Team.find_by(teamName: oppTeam).teamName
  end
  def shortTitle
    return Team.find_by(teamName: frontTeam).teamCode + " V/S " + Team.find_by(teamName: oppTeam).teamCode
  end

end
