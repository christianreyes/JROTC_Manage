namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    
	# Step 0: clear any old data in the db
    [Ribbon, Award].each(&:destroy_all)
	
	ribs =  ["Meritorious Achievement",
			 "Distinguished Unit",
			 "Distinguished Cadet",
			 "Honor Cadet",
			 "Cadet Achievement",
			 "Aptitude",
			 "Naval Science IV Outstanding Cadet",
			 "Naval Science III Outstanding Cadet",
			 "Naval Science II Outstanding Cadet",
			 "Naval Science I Outstanding Cadet",
			 "Exemplary Conduct",
			 "Academic Award",
			 "Exemplary Personal Appereance",
			 "Physical Fitness",
			 "Participation",
			 "Unit Service",
			 "Community Service",
			 "Drill Team",
			 "Color Guard",
			 "Rifle Team",
			 "Orienteering",
			 "Recruiting",
			 "Mini-Boot Camp",
			 "Sea Cruise"]
	
	ribs.each_with_index do |data, i|  
	  r = Ribbon.new( :name => data , :seniority => i)
	  r.save!
	end
    
	puts "Created #{ribs.length} ribbons"
	
    #Host.populate 12 do |host|
      # get some fake data using the Faker gem
      #host.first_name = Faker::Name.first_name
      #host.last_name = Faker::Name.last_name
  end
end