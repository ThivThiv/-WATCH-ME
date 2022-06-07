class WatchesController < ApplicationController
  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
    @booking = Booking.new
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)

    if @watch.save
      redirect_to @watch, notice: 'Votre montre est ajoutée !'
    else
      render :new
    end
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
    redirect_to watches_path
  end

  private

  def watch_params
    params.require(:watch).permit(:name, :description, :price, :photo)
  end
end
