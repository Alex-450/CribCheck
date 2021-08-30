class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.create(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:address, :user_id, :landlord_id)
  end
end
