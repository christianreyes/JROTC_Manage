class Award < ActiveRecord::Base
  attr_accessible :name, :cadet_id
  
  belongs_to :cadet
end
