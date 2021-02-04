class Skill < ApplicationRecord
	validates_presence_of :tile, :percent_utilized
end
