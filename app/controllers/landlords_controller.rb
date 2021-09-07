class LandlordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @landlords = Landlord.all
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      redirect_to new_property_path(id: @landlord.id)
    else
      render 'properties/new'
    end
  end

  def show
    @landlord = Landlord.find(params[:id])
    @properties = @landlord.properties
    @reviews = @landlord.reviews
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window: render_to_string(partial: "info_window", locals: { property: property })
      }
    end
  end

  private

  def landlord_params
    params.require(:landlord).permit(:name)
  end
end
