class Api::V1::AuthController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
          render json: { token: token, role: user.role, features: user.accessible_features }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
end
