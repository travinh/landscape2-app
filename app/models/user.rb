class User < ApplicationRecord
    has_secure_password
    has_many :landscapes
    has_many :teams, :through => :landscapes
    validates :email, uniqueness: true
    validates :email, presence: true
    accepts_nested_attributes_for :landscapes, reject_if: proc { |attributes| attributes['address'].blank?} 

    def self.create_with_omniauth(auth)
        create! do |user|
          user.provider = auth["provider"]
          user.id = auth["uid"]
          user.name = auth["info"]["name"]
        end
    end
end
