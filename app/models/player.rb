class Player < ApplicationRecord
    belongs_to :team
    TAGS = %i[Batsman Bowler All-Rounder Captain Vice-Captain Wicket-Keeper]
  
end
