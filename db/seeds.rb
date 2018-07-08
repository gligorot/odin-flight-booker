["JFK", "La Guardia"].each do |ap_name| 
	Airport.create!(name: ap_name,
									code: "NYC")
end
["SF Intl", "Oakland Intl"].each do |ap_name| 
	Airport.create!(name: ap_name,
									code: "SFO")
end

5.times do |n|
	Flight.create!(from_airport_id: rand(1..2),
								 to_airport_id:  rand(3..4),
								 takeoff:        Faker::Time.between(Date.tomorrow, 10.days.from_now,),
								 duration: 360)
end

5.times do |n|
	Flight.create!(to_airport_id: rand(1..2),
								 from_airport_id:  rand(3..4),
								 takeoff:        Faker::Time.between(Date.tomorrow, 10.days.from_now,),
								 duration: 360)
end

Flight.create!(	 from_airport_id:  1,
								 to_airport_id:  	 3,
								 takeoff:        Faker::Time.between(3.years.from_now, 3.years.from_now + 1.hour),
								 duration: 360)