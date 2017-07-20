class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user
  has_one :story

  def created_at
   object.created_at.strftime("%a %m-%d-%Y")
  end
end

