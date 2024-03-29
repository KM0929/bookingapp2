class UsersController < ApplicationController
  def account
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:user_image, :user_name, :user_introduction))
      redirect_to user_profile_path
    else
      render "profile"
    end
  end
end