class Team < ApplicationRecord
    has_many :players, dependent: :restrict_with_error
    # has_many :matches, dependent: :restrict_with_error
end
