class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :authentication_token, :email


end
