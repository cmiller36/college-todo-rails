class StoryCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  has_one :user, serializer: CommentUserSerializer
end
