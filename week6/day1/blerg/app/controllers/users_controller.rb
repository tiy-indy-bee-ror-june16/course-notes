class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path(anchor: "user-#{@user.id}")
    else
      render :new
    end
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio, :email, :password, :password_confirmation)
  end

end
