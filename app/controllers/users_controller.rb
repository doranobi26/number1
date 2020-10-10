class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = user.posts
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

  def personal
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
