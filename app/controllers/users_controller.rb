class UsersController < ApplicationController
  skip_before_action :authorize

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {user:@user}
    else
      render json: {error:"An Error Happened"}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
