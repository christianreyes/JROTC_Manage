class Event < ActiveRecord::Base
	belongs_to :cadet, :foreign_key => "cadet_in_charge_id"
	
	validates :name, :presence => true
	validates :date, :presence => true
end
