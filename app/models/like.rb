class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  counter_culture :comment
  validates :user_id, presence: true
  validates :comment_id, presence: true
end
