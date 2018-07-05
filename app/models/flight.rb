class Flight < ApplicationRecord
	belongs_to :from_airport, class_name: "Airport"
	belongs_to :to_airport, 	class_name: "Airport"

	def takeoff_formatted
		self.takeoff.strftime("%m/%d/%Y") #self.takeoff fk me
	end
	
	def self.get_takeoffs
		Flight.all.where("takeoff >= ?", DateTime.now).distinct.order(takeoff: :asc).pluck('date(takeoff)')
	end

	def parse_airport(action)
		if action == "from"
			Airport.find(self.from_airport_id).name 
		else
			Airport.find(self.to_airport_id).name
		end
	end
end
