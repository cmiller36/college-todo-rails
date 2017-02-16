class Story < ApplicationRecord

  belongs_to :user

  validates_presence_of :title, :content
  validates :user_id, presence: true
end
