class Team < ApplicationRecord
    has_many :landscapes
    has_many :users, :through => :landscapes
    validates :name, uniqueness: true, presence: true
end
