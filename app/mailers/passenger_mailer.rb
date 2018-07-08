class PassengerMailer < ApplicationMailer
	def thank_you_email
		@booking = params[:booking]
		@main_passenger = @booking.passengers.first
		@url = booking_url(@booking)

		mail(to: @main_passenger.email, subject: "Thanks for your Flight Ticket reservation!")
	end
end
