module ApplicationHelper
    # helper_method :current_user

    def current_user
        # @current_user || = User.find(session[:user_id]) if session[:user_id]
        User.find_by(id:session[:user_id])
    end

    def logged?
        !current_user.nil?
    end
    
    protected

    
end
