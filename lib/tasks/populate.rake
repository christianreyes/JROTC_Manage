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
	
	ribs =  [["Meritorious Achievement", "meritach"],
			 ["Distinguished Unit", "distunit"],
			 ["Distinguished Cadet","distcadet"],
			 ["Honor Cadet", "honorcad"],
			 ["Cadet Achievement","cadach"],
			 ["Aptitude","aptitude"],
			 ["Naval Science IV Outstanding Cadet","nsivoutcad"],
			 ["Naval Science III Outstanding Cadet","nsiiioutcad"],
			 ["Naval Science II Outstanding Cadet","nsiioutcad"],
			 ["Naval Science I Outstanding Cadet","nsioutcad"],
			 ["Exemplary Conduct","exemplary"],
			 ["Academic Award","academic"],
			 ["Exemplary Personal Appereance","personapp"],
			 ["Physical Fitness","physfit"],
			 ["Participation","participat"],
			 ["Unit Service","unitserv"],
			 ["Community Service","commserv"],
			 ["Drill Team","drillteam"],
			 ["Color Guard","colorguard"],
			 ["Rifle Team","rifleteam"],
			 ["Orienteering","orienteer"],
			 ["Recruiting","recruiting"],
			 ["Mini-Boot Camp","miniboot"],
			 ["Sea Cruise","seacruise"]]
	
	ribs.each_with_index do |data, i|  
	  r = Ribbon.new( :name => data[0] , :image_path => "ribbons/" + data[1] + ".jpg", :seniority => i)
	  r.save!
	end
    
	puts "Created #{ribs.length} ribbons"
	
    #Host.populate 12 do |host|
      # get some fake data using the Faker gem
      #host.first_name = Faker::Name.first_name
      #host.last_name = Faker::Name.last_name
  end
end