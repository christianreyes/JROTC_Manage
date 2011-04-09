namespace :db do
desc "Erase and fill database"
# creating a rake task within db namespace called 'populate'
# executing 'rake db:populate' will cause this script to run
task :populate => :environment do
	require 'populator'
	require 'faker'
	# Need two gems to make this work: faker & populator
	# Docs at: http://populator.rubyforge.org/
	# Docs at: http://faker.rubyforge.org/rdoc/
	
	# clear any old data in the db
	puts "Destroying all cadets, ribbons, awards..."
	[Cadet, Ribbon, Award].each(&:destroy_all)
	
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
	
	ribbons = Ribbon.all
	
	20.times do
		# get some fake data using the Faker gem
		c = Cadet.new
		c.first_name = Faker::Name.first_name
		c.last_name  = Faker::Name.last_name
		c.platoon = rand(10)
		c.email = Faker::Internet.free_email
		c.phone = Faker::PhoneNumber.phone_number
		c.save!
		
		2.times do
			a = Award.new
			a.cadet_id = c.id
			a.ribbon_id = ribbons[rand(ribbons.length-1)].id
			a.save!
		end
	end
	puts "Created 20 cadets"
	puts "Create 2 awards for every cadet"
	
	end
end	