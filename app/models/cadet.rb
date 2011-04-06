class Cadet < ActiveRecord::Base
	has_many :awards, :dependent => :destroy
	has_many :ribbons, :through => :awards
	belongs_to :ribbon

	def name
		first_name + " " + last_name
	end
end
