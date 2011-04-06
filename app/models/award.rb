class Award < ActiveRecord::Base
	belongs_to :cadet
	belongs_to :ribbon
	
	validates :cadet_id, :presence => true
	validates :ribbon_id, :presence => true
end
