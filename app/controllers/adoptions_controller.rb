class AdoptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:new, :create]
  before_action :set_adoption, only: [:destroy]

  def new
    @adoption = Adoption.new
  end

  def destroy
    @adoption.destroy
    @pet.update(status: 'available')
    redirect_to requests_path, notice: 'Adoption request was successfully deleted.'
  end

  def create
    @adoption = current_user.adoptions.build(adoption_params)
    @adoption.pet = @pet
    @adoption.adopter_email = current_user.email
    if @adoption.save
      @pet.update(status: 'pending')
      redirect_to requests_path, notice: 'Adoption request submitted successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_adoption
    @adoption = Adoption.find(params[:id])
    @pet = @adoption.pet
  end

  def adoption_params
    params.require(:adoption).permit(:pet_id, :message, :adopter_email)
  end
end
