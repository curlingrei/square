class User < ApplicationRecord
  before_save { email.downcase! }
  has_secure_password
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_many :bookposts
  mount_uploader :avatar, AvatarUploader
  has_many :booklikes
  has_many :bookcomments
  has_many :commentlikes

  def booklike(bookpost)
      self.booklikes.find_or_create_by(bookpost_id: bookpost.id) unless self.bookposts.include?(bookpost)
  end

  def bookdislike(bookpost)
    target_booklike = self.booklikes.find_by(bookpost_id: bookpost.id)
    target_booklike.destroy if target_booklike
  end

  def booklike?(bookpost)
    self.booklikes.exists?(bookpost_id: bookpost.id)
  end

  def delete_bookcomment(comment)
    target_comment = self.bookcomments.find_by(id: comment.id)
    target_comment.destroy if target_comment
  end

  def comment_like(comment)
    self.commentlikes.find_or_create_by(bookcomment_id: comment.id) unless self.commentlikes.include?(comment)
  end

  def comment_dislike(comment)
    target_comment = self.commentlikes.find_by(bookcomment_id: comment.id)
    target_comment.destroy if target_comment
  end

  def comment_like?(comment)
    self.commentlikes.exists?(bookcomment_id: comment.id)
  end
end
