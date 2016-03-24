class UsersController < ApplicationController

  before_action :to_log_in, only: [:index, :show, :edit, :update, :destroy]

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

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "編集完了"
      redirect_to :action => "show"
    else
      render 'edit'
    end
   end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:destroy] = "ユーザーは削除されました"
    redirect_to request.referrer
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:image_user)
  end

  def to_log_in
    unless logged_in?
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

end
