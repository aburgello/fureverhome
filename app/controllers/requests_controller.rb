class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index

    @my_requests = current_user.adoptions.includes(:pet)


    @requests_for_my_pets = Adoption.joins(:pet).where(pets: { user_id: current_user.id }).includes(:user).group_by(&:pet)
  end
end
