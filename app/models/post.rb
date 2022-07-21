class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :body, presence: true
  validates :file, presence: true
end
