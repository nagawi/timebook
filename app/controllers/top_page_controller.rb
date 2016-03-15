class TopPageController < ApplicationController
  def index

    @contents = current_user.postings.all
  end
end
