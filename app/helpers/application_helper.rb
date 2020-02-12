module ApplicationHelper

    def logged_in?
      !!session[:user_id]
      # or !!current_user
    end
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])  if  !!session[:user_id]
    end

      # reconsider action 
    def require_log_in
      if !logged_in? 
        redirect_to '/'
      end 
    end
      
end
