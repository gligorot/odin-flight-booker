class BookingsController < ApplicationController
  def new
  	@booking = Booking.new
  	params[:passenger_count].to_i.times { @booking.passengers.build }
  end

  def create
  	@booking = Booking.new(booking_params)
  	if @booking.save
      PassengerMailer.with(booking: @booking).thank_you_email.deliver_now
  		flash[:sucess] = "Flight successfully booked! The first passenger will 
                        receive an email with the booking information"
  		redirect_to @booking
  	else
  		flash.now[:danger] = "Error!"
  		render :new
  	end
  end

  def show
  	@booking = Booking.find(params[:id])
  end

  private
  	def booking_params
  		params.require(:booking).permit(:flight_id, :pass_count, 
  														passengers_attributes: [:id, :booking_id, :name, :email])
  	end
end
