# app/controllers/adoptions_controller.rb
class AdoptionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @adoptions = Adoption.all
  end

  def show
    # Code to show a single adoption
  end

  def new
    # Code to render a new adoption form
  end

  def create
    # Code to create a new adoption
  end

  def edit
    # Code to render edit form for an adoption
  end

  def update
    # Code to update an adoption
  end

  def destroy
    # Code to delete an adoption
  end
end
