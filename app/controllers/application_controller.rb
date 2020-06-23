class ApplicationController < ActionController::Base

    helper_method :current_user 
    helper_method :require_logged_in

    def welcome   
        if current_user  
       redirect_to user_path(@user) 
        else 
            redirect_to login_path
        end
    end

    def current_user
        @user = (User.find_by(id: session[:user_id]))
    end
    
     def logged_in?
        current_user.id != nil
      end
    
      def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless current_user && logged_in?
      end

end
