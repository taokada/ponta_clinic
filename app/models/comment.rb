class Comment < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :user, optional: true
  validates :body, presence: true
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user

  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  def iine?(user)
    iine_users.include?(user)
  end
end
