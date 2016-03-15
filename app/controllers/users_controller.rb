class UsersController < ApplicationController
  def index

    @users = User.all

  end

  def new

    @user = User.new

  end

  def show

  end

  def create

    @user = User.new(user_params)

    @user.save!
    redirect_to  :action => 'index',  notice: 'user was successfully updated.' 
  rescue => e
    render :'new'

  end

  def user_params

    params.require(:user).permit(:name,:email,:password)

  end
end
