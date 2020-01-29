class UserController < ApplicationController

  before_action :find_user, only: [:show, :update, :create]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end


  def create

  end

  def show

  end

  def destroy
  end



  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
