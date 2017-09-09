class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/resume'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :expertise, :password, :description, :career_id)
  end
end
