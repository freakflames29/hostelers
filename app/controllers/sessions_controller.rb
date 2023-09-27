# frozen_string_literal: true
class SessionsController < ApplicationController
  before_action :checkpoints,only: [:new,:create]
  def new
  end



  def create
    @user = User.find_by username: params[:session][:username]
    if @user && @user.authenticate(params[:session][:password])
      flash[:ok] = "You are logged in"
      session[:id] = @user.id
      session[:user] = @user
      session[:user_name] = @user.name
      redirect_to @user
    else
      flash[:fail] = "Wrong credentials"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:id] = nil
    session[:user] = nil
    session[:user_name] = nil

    flash[:ok] = "You are logged out"
    redirect_to login_path
  end
end
