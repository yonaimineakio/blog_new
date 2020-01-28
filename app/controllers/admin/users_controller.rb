class Admin::UsersController < ApplicationController


  before_action :find_user, only: [:show, :edit, :update]
  before_action :admin_user?
  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "Updated #{@user.name} successfully!"
    else
      render :edit
    end

  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "registed #{@user.name} successfully!"
    else
      render :new
    end
  end

  def index

    @users = User.all

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "Deleted successfully!"
  end

  private

  def user_params
    params.required(:user).permit(:name, :email, :admin, :password, :password_confirmation, :image)
  end

  def find_user
    @user=User.find(params[:id])
  end

  def admin_user?
    @user = current_user
    redirect_to posts_path, danger: "権限がありません" unless current_user.admin?


  end


end
