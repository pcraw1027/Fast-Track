class Api::V1::UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username, :country, :invite_code, :postal_code
end
