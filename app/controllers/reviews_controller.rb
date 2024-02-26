class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
