class BookingsController < ApplicationController
  def new
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new(booking_params)
    @booking.watch = @watch
    @booking.user = current_user
    if @booking.save
      redirect_to watch_booking_path(@watch, @booking)
    else
      render :show
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :watch_id)
  end
end
