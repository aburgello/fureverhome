class PetsController < ApplicationController

  def home
    @pets = Pet.all
  end

  def index
    @pets = Pet.all
  end
end
