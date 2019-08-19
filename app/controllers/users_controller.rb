class UsersController < ApplicationController
   # before_action :set_user, only: [:show, :index, :update, :destroy]

    def create
        @user = User.Create!(user_params)
        render json: @user
    end

    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user.update(user_params)
        head :no_content
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        head:no_content
    end


private

    def user_params
        params.require(:user).permit(:f_name, :l_name, :email, :password, :created_at, :updated_at)
    end

    def set_user
        @user = User.find(params[:id])
    end

end