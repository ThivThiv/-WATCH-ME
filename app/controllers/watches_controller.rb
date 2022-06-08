class WatchesController < ApplicationController
  before_action :set_watch, only: [:show, :destroy, :update, :edit]

  def index
    @watches = policy_scope(Watch).order(created_at: :desc)
    # @markers = @flats.geocoded.map do |flat|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    # end
  end

  def show
    @user = User.find(@watch.user_id)
    @booking = Booking.new
  end

  def new
    @watch = Watch.new
  end

  def edit
  end

  def update
    @watch.update(watch_params)
    redirect_to watch_path(@watch)
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user
    if @watch.save
      redirect_to watch_path(@watch), notice: 'Votre montre est ajoutée !'
    else
      render :new
    end
    authorize @watch
  end

  def destroy
    @watch.destroy
    redirect_to watches_path
  end

  private

  def set_watch
    @watch = Watch.find(params[:id])
    authorize @watch
  end

  def watch_params
    params.require(:watch).permit(:brand, :model, :description, :price, :photo)
  end
end
