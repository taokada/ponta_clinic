class Article < ApplicationRecord
  belongs_to :user,optional: true
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
