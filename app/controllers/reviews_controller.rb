class ReviewsController < ApplicationController
  before_action :set_user_profile, only: [:new, :show]


  def show
    @review = Review.find(params[:id])
  end

  def new
    @property = Property.find(params[:property_id])
    @review = Review.new
  end

  def create
    @property = Property.find(params[:property_id])
    @review = Review.new(review_params)
    @review.property = @property
    @review.user = current_user
    if @review.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:landlord_rating,
      :property_rating,
      :landlord_comment,
      :property_comment,
      :rental_cost,
      :communication,
      :photos,
      :cleanliness)
  end

  def set_user_profile
    @user_profile = current_user
  end
end
