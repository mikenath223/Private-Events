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
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
    @events = @current_user.events
  end



  # def signin_new
  #   render 'signin'
  # end

  # def signin
  #   user = User.find_by(name: params['users']['name'])
  #   if user
  #     # Signin user
  #     redirect_to root_path
  #     flash[:success] = "Signed in successfully"
  #   else
  #     flash.now[:danger] ='User doesn\'t exist'
  #     render 'new'
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
