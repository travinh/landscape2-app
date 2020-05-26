class Team < ApplicationRecord
    has_many :landscapes
    has_many :users, :through => :landscapes
    validates :name, uniqueness: true, presence: true
    accepts_nested_attributes_for :landscapes, reject_if: proc { |attributes| attributes['address'].blank?} 
end
