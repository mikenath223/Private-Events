class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include UsersHelper

    def Signin(user)
        cookies.permanent.signed[:user_id] = user.id
        current_user user
    end

    def logout
        cookies.delete(:user_id)
        redirect_to signin_path
    end
end
