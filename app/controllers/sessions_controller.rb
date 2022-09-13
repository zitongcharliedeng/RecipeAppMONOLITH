class SessionsController < ApplicationController
    include SessionsHelper
    def new
    end
  
    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            log_in(user)
            redirect_to '/home'
        else
            flash.now[:danger] = 'Invalid email/password combination' 
            render "sessions/failedlogin"
        end
    end

    def show
    end

    def delete
    end

    def destroy
    end
end
