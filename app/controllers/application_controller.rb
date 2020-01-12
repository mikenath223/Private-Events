# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  before_action :auth?

  def Signin(user)
    cookies.permanent.signed[:user_id] = user.id
    current_user
  end

  def logout
    cookies.delete(:user_id)
    redirect_to signin_path
  end

  def auth?
    unless signed?
      redirect_to signin_path
      flash[:danger] = 'You must be signed in to complete this action'
    end
  end
end
