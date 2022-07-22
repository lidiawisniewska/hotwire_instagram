class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :body, presence: true
  validates :file, presence: true

  after_create_commit do
    broadcast_prepend_to "posts_list",
      target: "posts",
      partial: "posts/post",
      locals: { post: self, user: nil }
  end
end
