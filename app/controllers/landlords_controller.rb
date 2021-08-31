class LandlordsController < ApplicationController
  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      redirect_to landlord_path(@landlord)
    else
      render :new
    end
  end

  def show
    @landlord = Landlord.find(params[:id])
    @properties = @landlord.properties
  end

  private

  def landlord_params
    params.require(:landlord).permit(:name)
  end
end
