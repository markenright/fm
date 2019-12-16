class Team < ActiveRecord::Base
    has_many :managers
    has_many :players
end