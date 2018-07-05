module FlightsHelper
	def flight_info(flight)
		"#{flight.parse_airport('from')} ->- 
		 #{flight.parse_airport('to')} --TAKEOFF AT-- 
		 #{flight.takeoff }"
	end

end
