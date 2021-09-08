class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @properties = Property.all
    @reviews = Review.all.last(10)
  end
end
