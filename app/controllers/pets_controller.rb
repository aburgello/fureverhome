class PetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy my_pets]
  before_action :authorise_owner!, only: %i[new create edit update destroy]
  before_action :load_requests

  def index
    @pets = Pet.all
    @featured_pets = Pet.where(status: 'available').limit(4)
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
      redirect_to pets_path, notice: 'Pet listing created successfully.'
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
    respond_to do |format|
    format.html { redirect_to pets_path, notice: 'Pet listing deleted.' }
    format.turbo_stream
    end
  end

  def my_pets
    @pets = current_user.pets
  end

  private

  def pet_params
    params.require(:pet).permit(:title, :description, :status, :breed, :age, :image_url, :image, :location)
  end

  def load_requests
    @my_requests = current_user.adoptions.where(status: 'pending')
    @requests_for_my_pets = Adoption.joins(:pet).where(pets: { user_id: current_user.id, status: 'pending' }).includes(:user).group_by(&:pet)
    @completed_requests_as_adopter = current_user.adoptions.where(status: ['accepted', 'rejected']).includes(:pet)
    @completed_requests_as_owner = Adoption.joins(:pet).where(pets: { user_id: current_user.id }, status: ['accepted', 'rejected'])
  end

  def authorise_owner!
    return if current_user.owner?

    redirect_to pets_path, alert: 'Only owners can manage pet listings.'
  end
end
