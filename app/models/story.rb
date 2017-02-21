class Story < ApplicationRecord

  belongs_to :user
  has_many :story_tags
  has_many :tags, :through => :story_tags
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :content
  validates :user_id, presence: true

  accepts_nested_attributes_for :tags, reject_if: :all_blank

  extend FriendlyId
  friendly_id :title, use: :slugged


  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.story_tags.build(tag: tag)
    end
  end

  
end
