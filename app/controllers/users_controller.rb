class UsersController < ApplicationController
    
    def new
    end
    
    def create 
        @user = User.create(user_params)
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        render controller: 'application', action: 'welcome'
    end


    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end 
end