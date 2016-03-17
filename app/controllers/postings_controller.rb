class PostingsController < ApplicationController

  before_action :to_log_in

  def index

    @postings = current_user.postings.all

  end

  def new

    @posting = Posting.new

    @users = User.all

  end

  def create

    @posting = Posting.new(posting_params)

    @posting.save!

    redirect_to  :action => 'index',  notice: 'posting was successfully updated.'
  rescue => e

    render :'new'

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
