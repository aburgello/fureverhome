class AdoptionsController < ApplicationController
  before_action :set_pet

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user = current_user
    @adoption.pet = @pet

    if @adoption.save
      redirect_to @pet, notice: 'Adoption request submitted successfully.'
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def adoption_params
    params.require(:adoption).permit(:user_id, :pet_id)
  end
end
