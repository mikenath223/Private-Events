class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def Signin(user)
        cookies.permanent.signed[:user_id] = user.id
    end

    def logout
        cookies.delete(:user_id)
        redirect_to users_path
    end
end
