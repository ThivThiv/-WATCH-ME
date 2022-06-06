class BookingsController < ApplicationController
  def new
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new(booking_params)
    @booking.watch = @watch
    if @booking.save
      redirect_to watch_path(@watch)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :watch_id)
  end
end
