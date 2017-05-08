class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :content, :user_id, :story_id, presence: true
end
