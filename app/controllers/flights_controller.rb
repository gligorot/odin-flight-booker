class FlightsController < ApplicationController
  def index
  	@flight = Flight.new

  	unless params[:flight].nil?
	  	@available_flights = Flight.all.where("from_airport_id = ? AND to_airport_id = ? AND takeoff = ?", params[:flight][:from_airport_id],																		params[:flight][:to_airport_id], 																		 DateTime.parse(params[:departure_date]))
	  end
end
end
