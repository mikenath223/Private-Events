module UsersHelper
    def signed
        return true if cookies[:user_id]
    end
end
