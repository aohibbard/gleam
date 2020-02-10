class SessionsController < ApplicationController

    def login
        if logged_in?
            redirect_to user_path(session[:user_id])
        else 
            render 'login'
        end 
    end 

    def create
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect to '/login'
        end 
    end 
    
    def destroy 
        session.delete :user_id 
        # render 'users/new'
        redirect_to login_path 
    end 

    def omniauth
    end 

    private 
    def user_paramas
        params.require(:user).permit(:username, :password)
    end 

    def auth
        request.env['omniauth.auth']
    end 

end 