class LandingController < ApplicationController
  def index
    @featured_pets = Pet.where(status: 'available').limit(4)
  end
end
