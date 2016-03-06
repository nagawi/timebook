class PostingsController < ApplicationController
  def index

    @postings = Posting.all

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
end
