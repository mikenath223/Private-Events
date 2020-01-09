# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Signin @user
      flash[:success] = 'Welcome to the app'
      redirect_to new_event_path
    else
      render 'new'
    end
  end

  def show
    if signed?
    @user ||= User.find_by(id: cookies.signed[:user_id])
    @events = @user.events
    else
      redirect_to signin_path
      flash[:danger] = "You need to be logged in to access this function."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
