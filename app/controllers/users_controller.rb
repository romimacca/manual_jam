class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
    end

    def create
        @user = User.create(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to root_path, :notice => "Bienvenid@!"
        else
            render "new"

        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end