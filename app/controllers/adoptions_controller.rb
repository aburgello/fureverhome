class AdoptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:new, :create]
  before_action :set_adoption, only: [:destroy, :accept]
  before_action :load_requests, only: [:index, :accept, :destroy]

  def index
    # This action can be used to display all requests if needed
  end

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
    @adoption.status = 'pending'
    if @adoption.save
      @pet.update(status: 'pending')
      redirect_to requests_path, notice: 'Adoption request submitted successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    if @adoption.update(status: 'accepted') && @pet.update(status: 'adopted')
      Message.create!(
        adoption: @adoption,
        user: current_user,
        content: "Congratulations! #{@pet.title} is now yours."
      )
      redirect_to requests_path, notice: 'Adoption request accepted.'
    else
      redirect_to requests_path, alert: 'Failed to accept the adoption request.'
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

  def load_requests
    @my_requests = current_user.adoptions.where(status: 'pending')
    @requests_for_my_pets = Adoption.joins(:pet).where(pets: { user_id: current_user.id, status: 'pending' }).includes(:user).group_by(&:pet)
    @completed_requests_as_adopter = current_user.adoptions.where(status: ['accepted', 'rejected']).includes(:pet)
    @completed_requests_as_owner = Adoption.joins(:pet).where(pets: { user_id: current_user.id }, status: ['accepted', 'rejected'])
  end

  def adoption_params
    params.require(:adoption).permit(:pet_id, :message, :adopter_email)
  end
end
