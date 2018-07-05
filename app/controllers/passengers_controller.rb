class PassengersController < ApplicationController
	def new
		@passenger = Passenger.new
	end

	def create
		@passenger = Passenger.new(passenger_params)
		flash[:danger] = "error saving passenger" unless @passenger.save
	end

	private
		def passenger_params
			params.require(:passenger).permit(:booking_id, :name, :email)
		end
end
