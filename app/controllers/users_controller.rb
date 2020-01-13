# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :auth?, only: %i[new create]
  before_action :current_user, :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to the app'
      redirect_to new_event_path
    else
      render 'new'
    end
  end

  def show
    @events = @user.events
    @upcoming_events = @user.attended_events.upcoming_events
    @prev_events = @user.attended_events.prev_events
  end

  def edit; end

  def update
    if @user.update(update_params)
      flash[:success] = 'User successfully updated'
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
    flash[:danger] = 'User deleted successfully!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def update_params
    params.require(:user).permit(:name)
  end
end
