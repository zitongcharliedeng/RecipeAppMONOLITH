class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the Sample App!"
            redirect_to "/users/#{@user.id}"
        else
            render 'users/failedsignup'
        end
    end


    private #helper functions only for METHODS within the class (.method.private_method)
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
