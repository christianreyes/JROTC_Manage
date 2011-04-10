class Award < ActiveRecord::Base
	cattr_reader :per_page
    @@per_page = 20

	belongs_to :cadet
	belongs_to :ribbon
	
	validates :cadet_id, :presence => true
	validates :ribbon_id, :presence => true
end
