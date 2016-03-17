class TopPageController < ApplicationController
  def index
    @contents = current_user.feed
  end
end
