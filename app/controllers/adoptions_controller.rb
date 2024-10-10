class AdoptionsController < ApplicationController
  before_action :set_pet, only: [:new, :create]
  before_action :set_adoption, only: [:destroy]

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user = current_user
    @adoption.pet = @pet
    @adoption.status = 'Pending'
    @adoption.adopter_name = current_user.name
    @adoption.adopter_email = current_user.email

    if @adoption.save
      @pet.update(status: 'pending')
      redirect_to requests_path, notice: 'Adoption request submitted successfully.'
    else
      render :new
    end
  end

  def destroy
    @adoption.destroy
    @adoption.pet.update(status: 'available')
    respond_to do |format|
      format.html { redirect_to requests_path, notice: 'Adoption request deleted successfully.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@adoption) }
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_adoption
    @adoption = Adoption.find(params[:id])
  end

  def adoption_params
    params.require(:adoption).permit(:message, :pet_id)
  end
end
