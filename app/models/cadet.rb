class Cadet < ActiveRecord::Base
  attr_accessible :name, :platoon
  
  has_many :awards
end
