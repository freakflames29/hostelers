class UsersController < ApplicationController
  before_action :checkpoints,only: [:new,:create]
  before_action :require_user ,only: [:show]
  def new
    @user=User.new
  end

  def show
    @user=User.find params[:id]
    @hostels=@user.hostels

  end

  def create
    @user=User.new filter_params
    puts "#{@user.inspect}-********************************************-"
    if @user.save
      flash[:ok]="User created successfully,login to continue"
      redirect_to login_path
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
    @user=User.find params[:id]
  end

  def update
    @user=User.find params[:id]
    if @user.update filter_params
      flash[:ok] = "User details updated"
      redirect_to @user
    else
      render :edit ,status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def filter_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:phone,:owner,:username,:desc)
  end
end
