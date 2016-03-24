class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email:params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'ログインに成功しました'
      redirect_to :controller => 'postings', :action => 'new'
    else
      flash.now[:notice] = 'ログインに失敗しました'
      render 'new'
    end
  end
  def destroy
   log_out
   redirect_to :action => 'new'
  end
end
