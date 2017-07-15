class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :slug, :created_at, :comments_count
  has_one :user, serializer: StoryUserSerializer
  has_many :comments, serializer: StoryCommentSerializer
  has_many :tags

  def comments_count
    object.comments.count
  end

  def created_at
    object.created_at.strftime("%a %m-%d-%Y")
  end
end
