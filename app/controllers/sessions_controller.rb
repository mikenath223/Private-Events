# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :auth?, only: %i[new create]
  before_action :signed_in?

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      # &.authenticate(params[:session][:password])
      redirect_back fallback_location: root_path
      remember(user)
      flash[:success] = 'Signed in successfully'
    else
      flash.now[:danger] = 'Account doesn\'t exist'
      render 'new'
    end
  end

  private

  def signed_in?
    return unless current_user

    flash[:alert] = 'You are signed in.'
    redirect_to root_path
  end
end
