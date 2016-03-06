class Posting < ActiveRecord::Base

  belongs_to :user

  mount_uploader :image_posting, ImagePostingUploader
end
