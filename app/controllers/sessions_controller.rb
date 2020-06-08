class SessionsController < ApplicationController
    def new 
        @user = User.new  
    end 

    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          redirect_to new_user_path 
      end
    end
    
      def destroy
        session.delete :user_id
    
        redirect_to '/'
      end
    end