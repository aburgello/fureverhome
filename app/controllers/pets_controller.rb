class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pets = Pet.all
  end

  def edit
  end
end
