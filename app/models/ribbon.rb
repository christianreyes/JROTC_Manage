class Ribbon < ActiveRecord::Base
	has_many :awards, :dependent => :destroy
	has_many :cadets, :through => :awards
	belongs_to :cadet
	
	scope :all, order(:seniority.asc)
	
	validates :name, :presence => true
end
