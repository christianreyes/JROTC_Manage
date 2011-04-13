class Cadet < ActiveRecord::Base
	has_many :events, :source => :cadet_in_charge_id
	has_many :awards, :dependent => :destroy
	has_many :ribbons, :through => :awards
	belongs_to :ribbon
	
	scope :all, order(:last_name.asc, :first_name.asc)
	
	def name
		if middle_name
			last_name + ", " + first_name + " " + middle_name.chars.to_a[0]
		else
			last_name + ", " + first_name
		end
	end
	
	def as_json(options = {})
		{
			:id => self.id,
			:name => self.name
		}
	end
	
	def self.name_like(input_name)
		cadets = Cadet.all
		if input_name
			return cadets.select{ |c| c.name.downcase=~/\w*#{input_name.downcase}\w*/} 
		else
			return cadets
		end
	end

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :platoon, :presence => true
end
