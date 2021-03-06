class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user # shorthand for redirect_to user_url(@user)
      flash[:success] = "Welcome to the Sample App"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
