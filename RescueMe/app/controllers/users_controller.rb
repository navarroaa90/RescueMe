class UsersController < ApplicationController
    def new
        @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Thanks for signing up! Lets give these pets a new home!"
        redirect_to root_path
    else
        render :new
    end
end

private

    #strong params
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end