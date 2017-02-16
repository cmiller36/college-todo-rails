class Story < ApplicationRecord

  belongs_to :user
  has_many :story_tags
  has_many :tags, :through => :story_tags
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :content
  validates :user_id, presence: true

  accepts_nested_attributes_for :tags, reject_if: :all_blank
end
