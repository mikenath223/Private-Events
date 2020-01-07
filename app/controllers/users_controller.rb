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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
