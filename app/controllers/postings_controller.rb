class PostingsController < ApplicationController

  before_action :to_log_in

  def index
    @postings = current_user.postings.all
  end

  def new
    @posting = Posting.new
  end

  def create
    @posting = current_user.posting.new(posting_params)
    @posting.save!
    redirect_to  :action => 'index'
  rescue => e
    render :'new'
  end

  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy
    flash[:success] = "投稿は削除されました"
    redirect_to request.referrer
  end

  def posting_params
    params.require(:posting).permit(:name,:note,:user_id,:image_posting)
  end

  def to_log_in
    unless logged_in?
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

end
