class UsersController < ApplicationController

  before_action :to_log_in

  def index

    @users = User.all

  end

  def new

    @user = User.new

  end

  def show

  @user = User.find(params[:id])

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

  def to_log_in

    unless logged_in?
      redirect_to :controller => 'sessions', :action => 'new'
    end

  end
end
