class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to('/resume', notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user}
      else
        redirect_to '/signup'
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :expertise, :password, :description, :career_id)
  end
end
