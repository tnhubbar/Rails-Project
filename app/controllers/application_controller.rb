class ApplicationController < ActionController::Base
    helper_method :current_user

    def welcome 
        if !session[:user_id] 
            flash.alert = "User not found."
            redirect_to login_path 
        else 
            current_user 
            redirect_to user_path(@user) 
            binding.pry
        end 
    end

    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end
    
     # def logged_in?
        #current_user.id != nil
      #end
    
      #def require_logged_in
        #return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
      #end

end
