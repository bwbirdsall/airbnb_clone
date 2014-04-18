class UsersController < ApplicationController
  def index
    @users = User.all
    authorize! :manage, User
  end

  def show
    @user = User.find(params[:id])
    authorize! :manage, User
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "#{@user.username} has had his/her privileges adjusted."
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
