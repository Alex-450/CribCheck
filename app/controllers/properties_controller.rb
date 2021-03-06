class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @properties = Property.global_search(params[:query])
    else
      @properties = Property.all
    end

    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window: render_to_string(partial: "info_window", locals: { property: property })
      }
    end
  end

  def show
    @property = Property.find(params[:id])
    @property.user = current_user
    @review = Review.new
    unless @property.latitude.nil?
      @markers = [@property].map do |p|
        {
          lat: p.latitude,
          lng: p.longitude,
          info_window: render_to_string(partial: "info_window", locals: { property: p })
        }
      end
    else
      @markers = []
    end
  end

  def new
    @property = Property.new
    @landlord = Landlord.new
    @review = Review.new
  end

  def create
    @property = Property.create(property_params)
    @property.user = current_user
    if @property.save
      redirect_to new_property_review_path(@property)
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:address, :user_id, :landlord_id)
  end
end
