module ApplicationHelper

    def logged_in?
        !!session[:user_id]
      end
    
      def current_user
        @current_user ||= User.find_by_id(session[:user_id])  if  !!session[:user_id]
      end

      # reconsider action 
      def require_logged_in
        redirect_to controller: 'sessions', action: 'new' unless current_user
      end
      
end
