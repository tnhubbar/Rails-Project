class UsersController < ApplicationController
    helper_method :current_user 
    
    def new
        @user = User.new 
    end
    
    def create 
        @user = User.create(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else 
         render 'new'   
        end
    end

    def show
        @user = (User.find_by(id: session[:user_id]))
    end 


    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end 
end