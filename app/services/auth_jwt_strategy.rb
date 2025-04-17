class AuthJwtStrategy

  def initialize(u)
    @user = u
  end

  def authenticate_user
    time = 24.hours.from_now
    payload = {
    sub: @user.id,      
    exp: time.to_i, 
    jti: SecureRandom.uuid 
  }

    AllowlistedJwt.create(jti: payload[:jti], user_id: @user.id, exp: time)

    encode_jwt(payload)

  end

  private

  def encode_jwt(payload)
    JWT.encode(payload, Rails.application.credentials.devise_jwt_secret_key, 'HS256') # Update 'HS256' if using a different algorithm
  end

end