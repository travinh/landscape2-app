class Landscape < ApplicationRecord
    validates :address, uniqueness: true, presence: true
end
