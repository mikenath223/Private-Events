class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      # user.name
      cookies.permanent.signed[:user_id] = user.id
      current_user
      signed?

      redirect_to root_path
      flash[:success] = "Signed in successfully"
    else
      flash.now[:danger] ='User doesn\'t exist'
      render 'new'
    end
  end
end
