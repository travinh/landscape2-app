class User < ApplicationRecord
    has_secure_password
    has_many :landscapes
    has_many :teams, :through => :landscapes
    validates :email, uniqueness: true
    validates :email, presence: true
    accepts_nested_attributes_for :landscapes, reject_if: proc { |attributes| attributes['address'].blank?} 

    # def self.create_with_omniauth(auth)
    #     byebug
    #     create! do |user|
    #       user.provider = auth["provider"]
    #       user.name = auth["info"]["name"]
    #       user.email = auth["info"]["email"]
    #       user.password = auth['credentials']['token']

    #     end
    #     user
    # end

    def self.find_or_create_by_auth(auth)
  
        user = User.find_or_create_by(provider: auth['provider'])
    
       
        user.name = auth['info']['name']
        user.email = auth['info']['email']
        user.password = auth['credentials']['token']
    
        user.save
        user
    end
end
