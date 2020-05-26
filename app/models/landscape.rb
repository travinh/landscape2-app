class Landscape < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :team, optional: true
    validates :address, uniqueness: true, presence: true
end
