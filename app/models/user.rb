class User < ActiveRecord::Base
  has_many :postings, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { :in => 4..12 }

  mount_uploader :image_user, ImageUserUploader

  def feed
    Posting.where("user_id IN (?) OR user_id = ?", following_ids, id)
  end

  def follow(other_user)
   active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end

