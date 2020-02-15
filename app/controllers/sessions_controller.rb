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
            redirect_to '/login'
        end 
    end 
    
    def destroy 
        session.delete :user_id 
        # render 'users/new'
        # redirect_to login_path 
        redirect_to '/'
    end 

    def omniauth 
        binding.pry
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private 
    def user_paramas
        params.require(:user).permit(:username, :password)
    end 

    def auth
        request.env['omniauth.auth']
    end 

end 