class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :slug
end
