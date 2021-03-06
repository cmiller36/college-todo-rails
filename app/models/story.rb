class Story < ApplicationRecord

  belongs_to :user
  has_many :story_tags
  has_many :tags, :through => :story_tags, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  scope :most_comments, -> { left_joins(:comments).group("stories.id").order("count(comments.id) DESC") }
  
  extend FriendlyId
  friendly_id :title, use: :slugged


  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.story_tags.build(tag: tag)
    end
  end

end
