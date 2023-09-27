# frozen_string_literal: true

class HostelsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
    @hostels = Hostel.order(created_at: :desc)
  end

  def new
    @hostel = Hostel.new
  end

  def create
    @hostel = Hostel.new filter_params
    @hostel.user = User.find session[:id]
    if @hostel.save
      flash[:ok] = "Hostel uploaded successfully !"
      redirect_to @hostel
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @hostel = Hostel.find params[:id]
  end

  def update
    @hostel = Hostel.find params[:id]
    if @hostel.update filter_params
      flash[:ok] = "Hostel details are updated"
      redirect_to @hostel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @hostel = Hostel.find params[:id]
  end

  private

  def filter_params
    params.require(:hostel).permit(:title, :desc, :landmark, :zipcode, :city, :country, :img, :address)
  end
end