class Event < ActiveRecord::Base
	belongs_to :cadet, :foreign_key => "cadet_in_charge_id"
	
	scope :all, order(:name.asc)
	scope :upcoming, where(:date > Date.yesterday).order(:date.desc)
    scope :past, where(:date <= Date.yesterday).order(:date.desc)
	
	validates :name, :presence => true
	validates :date, :presence => true
end
