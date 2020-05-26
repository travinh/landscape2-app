class User < ApplicationRecord
    has_secure_password
    has_many :landscapes
    has_many :teams, :through => :landscapes
    validates :email, uniqueness: true
    validates :email, presence: true
end
