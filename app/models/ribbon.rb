class Ribbon < ActiveRecord::Base
	has_many :awards, :dependent => :destroy
	has_many :cadets, :through => :awards
	belongs_to :cadet
	
	validates :name, :presence => true
end
