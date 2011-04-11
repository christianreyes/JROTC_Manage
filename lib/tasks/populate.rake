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
	puts "Destroying all cadets, ribbons, awards, events..."
	[Cadet, Ribbon, Award, Event].each(&:destroy_all)
	
	ribs =  [["Meritorious Achievement", "meritach",nil,nil],
			["Distinguished Unit", "distunit",nil,nil],
			["Distinguished Cadet","distcadet",nil,nil],
			["Honor Cadet", "honorcad",nil,nil],
			["Cadet Achievement","cadach",nil,nil],
			["Aptitude","aptitude",nil,nil],
			["Naval Science IV Outstanding Cadet","nsivoutcad",nil,nil],
			["Naval Science III Outstanding Cadet","nsiiioutcad",nil,nil],
			["Naval Science II Outstanding Cadet","nsiioutcad",nil,nil],
			["Naval Science I Outstanding Cadet","nsioutcad",nil,nil],
			["Exemplary Conduct","exemplary",nil,nil],
			["Academic Award","academic",nil,nil],
			["Exemplary Personal Appearance","personapp",nil,nil],
			["Physical Fitness","physfit",nil,nil],
			["Participation","participat",nil,3],
			["Unit Service","unitserv",10,nil],
			["Community Service","commserv",10,nil],
			["Drill Team","drillteam",nil,3],
			["Color Guard","colorguard",nil,3],
			["Rifle Team","rifleteam",nil,3],
			["Orienteering","orienteer",nil,3],
			["Recruiting","recruiting",nil,nil],
			["Mini-Boot Camp","miniboot",nil,1],
			["Sea Cruise","seacruise",nil,1]]
	
	ribs.each_with_index do |data, i|  
		r = Ribbon.new( :name => data[0] , 
						:image_path => "ribbons/" + data[1] + ".jpg", 
						:seniority => (i+1),
						:num_hours => data[2],
						:num_events => data[3]
						)
		r.save!
	end
	
	puts "Created #{ribs.length} ribbons"
	
	ribbons = Ribbon.all
	
	20.times do
		# get some fake data using the Faker gem
		c = Cadet.new
		c.first_name = Faker::Name.first_name
		if (rand() < 0.95)
			c.middle_name = Faker::Name.first_name
		end
		c.last_name  = Faker::Name.last_name
		c.platoon = rand(10)
		c.class_year = rand(4)+1
		c.email = Faker::Internet.free_email(c.first_name + "." + c.last_name)
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
	
	cadetList = Cadet.all
	
	eventArray = ["Gate Guard", 
					"PRT", 
					"CG Practice", 
					"Orienteering", 
					"Nationals Practice", 
					"AMI Practice", 
					"AX Practice", 
					"Colorguard",
					"Cadet Staff Meeting",
					"AR Practice",
					"UX Practice",
					"Brain Brawl",
					"UR Practice",
					"Drill Test",
					"Marksmanship Practice"]
	
	15.times do
		e = Event.new
		e.name = eventArray[rand(14)] 
		e.date = rand(10.days).from_now
		e.start_time = rand(10).hours.from_now
		e.end_time = e.start_time + (rand(3)+1).hours
		e.description = Faker::Lorem.sentence(rand(15))
		if (rand() < 0.75)
			e.cadet_in_charge_id = cadetList[rand(cadetList.length-1)].id
		end
		e.save!
	end

	puts "Created 15 events"
	
	end
end	
