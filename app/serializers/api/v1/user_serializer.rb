class Api::V1::UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username, :country, :invite_code, :postal_code, :role,
              :status, :photo, :avatar, :first_name, :last_name, :app_notify_on, :email_notify_on
end
