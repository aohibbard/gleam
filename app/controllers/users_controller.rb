class UsersController < ApplicationController
    before_action :require_log_in, only: [:show]
    #   skip_before_action :require_login, only: [:index]
    # refer to application helper


    def new
        if logged_in?
            redirect_to user_path(current_user)
          else
            @user = User.new
            # error message
            # 
            # flash.now[:danger] = "MSG TXT" if @user.empty?
        end
    end 

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome #{@user.username}"
            redirect_to user_path(@user)
        else
            flash[:notice] = "There was an error with your inputs."
            redirect_to :new
        end
    end 

    def show
        @user = User.find_by(id: params[:id])
    end 
      
    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end 
end
