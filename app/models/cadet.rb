class Cadet < ActiveRecord::Base
	has_many :events, :source => :cadet_in_charge_id
	has_many :awards, :dependent => :destroy
	has_many :ribbons, :through => :awards
	belongs_to :ribbon
	
	scope :all, order(:last_name.asc, :first_name.asc)
	
	def name
		if middle_name
			last_name + ", " + first_name + " " + middle_name[0].to_s
		else
			last_name + ", " + first_name
		end
	end
	
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :platoon, :presence => true
end
