# frozen_string_literal: true

class HostelsController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :edit_restrictions,only: [:edit,:update]

  def index
    @hostels = Hostel.order(created_at: :desc)
  end

  def new
    @hostel = Hostel.new
  end

  def edit_restrictions
    @hostel=Hostel.find params[:id]
    puts "#{@hostel.user.inspect}************************---------------"
    puts "#{current_user.inspect}************************---------------"
    unless @hostel.user.eql?(current_user)
      flash[:fail] = "You cant edit this hostel info"
      redirect_to @hostel
    end
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

  
  def destroy
    @hostel=Hostel.find params[:id]
    if @hostel.destroy
      flash[:ok] = "Hostel deleted!"
      redirect_to hostels_path
    else
      flash[:fail] = "Error while deleting hostel"
      redirect_to root_path
    end
    
  end
  private

  def filter_params
    params.require(:hostel).permit(:title, :desc, :landmark, :zipcode, :city, :country, :img, :address)
  end
end