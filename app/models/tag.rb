class Tag < ApplicationRecord
  has_many :story_tags
  has_many :stories, :through => :story_tags

  validates :name, uniqueness: { case_sensitive: false }

  extend FriendlyId
  friendly_id :name, use: :slugged
end
