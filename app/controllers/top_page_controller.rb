class TopPageController < ApplicationController

  before_action :to_log_in

  def index
    @contents = current_user.feed
  end

  def to_log_in

    unless logged_in?
      flash[:notice] = 'ログインしてください'
      redirect_to :controller => 'sessions', :action => 'new'
    end

  end
end
