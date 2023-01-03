module SessionsHelper
    def log_in(user)
        if (user == 0) 
            p "111111111111"
            return session[:user_id] = nil 
        else
            p "222222222222"
            session[:user_id] = user.id 
            session[:email] = user.email
        end
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    def logged_in?
        !current_user.nil?
    end
end
