class FlightsController < ApplicationController
  def index
  	@flight = Flight.new

	  @available_flights = available_flights 			unless params[:flight].nil?
	  @passenger_count = params[:passenger_count] unless params[:flight].nil?

	  #debugger
	end

	def available_flights
		Flight.all.where("from_airport_id = ? AND to_airport_id = ?",
																						params[:flight][:from_airport_id],
																						params[:flight][:to_airport_id])
																						.where(takeoff: DateTime.parse(params[:departure_date]).all_day)
																						.order(takeoff: :asc)
	end
	

end
