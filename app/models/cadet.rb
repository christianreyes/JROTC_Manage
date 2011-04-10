class Cadet < ActiveRecord::Base
	has_many :events, :source => :cadet_in_charge_id
	has_many :awards, :dependent => :destroy
	has_many :ribbons, :through => :awards
	belongs_to :ribbon
	
	scope :all, order(:last_name.asc, :first_name.asc)
	
	def name
		last_name + ", " + first_name
	end
	
	validates :name, :presence => true
	validates :platoon, :presence => true
end
