class UsersController < ApplicationController
    helper_method :current_user 
    
    def new
        @user = User.new 
    end
    
    def create 
        @user = User.create(user_params)
        return head(:forbidden) unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = current_user
    end 


    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end 
end