class User < ApplicationRecord
    has_many :landscapes
    has_many :teams, :through => :landscapes
end
