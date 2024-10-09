class PetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :authorise_owner!, only: %i[new create edit update destroy]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to @pet, notice: 'Pet listing created successfully.'
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet listing updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, notice: 'Pet listing deleted.'
  end

  private

  def pet_params
    params.require(:pet).permit(:title, :description, :status, :breed, :age, :image_url)
  end

  def authorise_owner!
    return if current_user.owner?

    redirect_to pets_path, alert: 'Only owners can manage pet listings.'
  end
end
