module UsersHelper
    def signed?
      return true if cookies[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: cookies.signed[:user_id])
    end
  
    def current_user=(user)
      @current_user = user.name
    end

    def events
      @events ||= User.find_by(id: cookies.signed[:user_id]).events
    end
end
