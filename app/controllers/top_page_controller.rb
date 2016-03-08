class TopPageController < ApplicationController
  def index

    @contents = Posting.all
  end
end
