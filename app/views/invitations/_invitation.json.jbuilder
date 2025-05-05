json.extract! invitation, :id, :user_id, :invite_code, :email, :status, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
