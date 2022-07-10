class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/login
  def login
    @user = User.find_by_email params[:email]

    if @user&.authenticate params[:password]
      token = jwt_encode user_id: @user.id
      exp_time = 1.days.from_now.to_i
      
      render json: {
        token: token,
        exp: exp_time,
        user_name: @user.user_name
      }, status: :ok
    else
      render json: {
        error: 'unauthorized user'
      }, status: :unauthorized
    end
  end
end
