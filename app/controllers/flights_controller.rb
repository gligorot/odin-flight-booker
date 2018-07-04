class FlightsController < ApplicationController
  def index
  	@flight = Flight.new
  	@flight_dates = Flight.all.pluck("DISTINCT takeoff").map{ |date| date.strftime("%d/%m/%Y") }
  end
end
