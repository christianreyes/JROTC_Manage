class Award < ActiveRecord::Base
	belongs_to :cadet
	belongs_to :ribbon
	
	attr_reader :cadet_token_id
	
	def cadet_token_id=(cid)
		self.cadet_id = cid
	end
	
	validates :cadet_id, :presence => true
	validates :ribbon_id, :presence => true
end
