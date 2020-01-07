class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to root_path
  end

  def show
    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)

  end
end
