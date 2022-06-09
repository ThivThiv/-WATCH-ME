class ReviewsController < ApplicationController
  def new
    @watch = Watch.find(params[:watch_id])
    @review = Review.new
  end

  def create
    @watch = Watch.find(params[:watch_id])
    @review = Review.new(review_params)
    @review.watch = @watch
     if @review.save
        redirect_to watch_path(@watch)
      else
        render :new
      end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
