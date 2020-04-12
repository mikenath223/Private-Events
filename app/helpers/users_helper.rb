# frozen_string_literal: true

module UsersHelper
  def signed?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def current_user=(user)
    @current_user = user.name
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    @current_user = nil
  end

  def events
    @events ||= User.find_by(id: cookies.signed[:user_id]).events
  end

  def user_name
    first_name = current_user.name.split(' ')[0]
    first_name.length > 10 ? first_name[0..8] + '...' : first_name
  end
end
