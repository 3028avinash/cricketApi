class Account < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :withdraws
    has_many :earns
end
