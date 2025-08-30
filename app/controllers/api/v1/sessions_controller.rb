class Api::V1::SessionsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:show, :destroy, :destroy_all]

  def show 
    render json: { user_profile: Api::V1::UserSerializer.new(current_user).serializable_hash[:data][:attributes] }, 
status: :ok
  end

  
  def create
    user = User.find_by(email: params[:email]) || User.find_by(username: params[:email].downcase)
    render json: { error: 'email or username not found.' }, status: :unauthorized and return  unless user
    if user && user.valid_password?(params[:password]) && user.active?
      
      token = AuthJwtStrategy.new(user).authenticate_user()
     
      render json: {
        message: 'Logged in successfully.',
        user: Api::V1::UserSerializer.new(user).serializable_hash[:data][:attributes],
        token: token
      }, status: :ok
    elsif user && user.valid_password?(params[:password]) && !user.active?
       render json: { error: "Your account has been #{user.status}. Please contact support." }, status: :unauthorized
    else
      render json: { error: 'Invalid password.' }, status: :unauthorized
    end
  end


  def destroy
    token = request.headers['Authorization'].split.last
    jwt_payload = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key, true, { algorithm: 'HS256' })

    if jwt_payload && AllowlistedJwt.find_by(jti: jwt_payload[0]['jti'])
      AllowlistedJwt.find_by(jti: jwt_payload[0]['jti']).destroy
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: "Couldn't find active session." }, status: :unauthorized
    end
  end


  def destroy_all
    if current_user
      AllowlistedJwt.where(user_id: current_user.id).destroy_all
      render json: { message: 'Logged out from all devices' }, status: :ok
    else
      render json: { error: 'User not authenticated.' }, status: :unauthorized
    end
  end


end