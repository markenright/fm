class Team < ActiveRecord::Base
    belongs_to :manager
    has_many :players
end