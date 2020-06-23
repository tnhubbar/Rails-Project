class SessionsController < ApplicationController
    def new  
    end 

    def fb_create
      @user = User.find_or_create_by(username: auth["info"]["email"]) do |user|
        user.name = auth["info"]["name"]
        user.password = "password"
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
        flash[:notice] =  'Password is incorrect. Or user does not exist, please sign up.'
        redirect_to new_user_path
      end
    end

    
      def destroy
        session.delete :user_id
    
        redirect_to '/'
      end


      def auth
        request.env["omniauth.auth"]
      end

    end