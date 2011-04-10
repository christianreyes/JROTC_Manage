class Event < ActiveRecord::Base
	belongs_to :cadet, :foreign_key => "cadet_in_charge_id"
end
