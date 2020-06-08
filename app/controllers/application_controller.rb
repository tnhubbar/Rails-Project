class ApplicationController < ActionController::Base
    helper_method :current_user

    def welcome 
        if @user 
       @user = User.find_by(id: session[:user_id])
        else 
            redirect_to login_path
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
