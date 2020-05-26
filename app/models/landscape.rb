class Landscape < ApplicationRecord
    belongs_to :user
    belongs_to :team
    validates :address, uniqueness: true, presence: true
end
