class Posting < ActiveRecord::Base

  belongs_to :user

  validates :note, presence: true
  validates :image_posting, presence: true

  mount_uploader :image_posting, ImagePostingUploader
end
