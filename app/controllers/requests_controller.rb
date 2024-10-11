class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_requests = current_user.adoptions.where(status: 'pending').includes(:pet)
    @requests_for_my_pets = Adoption.joins(:pet).where(pets: { user_id: current_user.id, status: 'pending' }).includes(:user).group_by(&:pet)
    @completed_requests_as_adopter = current_user.adoptions.where(status: ['accepted', 'rejected']).includes(:pet)
    @completed_requests_as_owner = Adoption.joins(:pet).where(pets: { user_id: current_user.id }, status: ['accepted', 'rejected'])
  end
end
