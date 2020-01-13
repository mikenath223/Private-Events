# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :auth?, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      sign_in user
      redirect_to root_path
      flash[:success] = 'Signed in successfully'
    else
      flash.now[:danger] = 'User doesn\'t exist'
      render 'new'
    end
  end
end
