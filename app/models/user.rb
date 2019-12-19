class User < ActiveRecord::Base   
    has_secure_password

    validates :name, presence: true   
    validates :username, presence: true, uniqueness: true
    validates :password, length: {in: 4..20}, unless: ->(u){u.password.blank?}
    
    has_many :teams
end