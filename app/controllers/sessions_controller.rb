class SessionsController < ApplicationController

  skip_before_action :authenticate

  def create
    user = User.find_by(username: auth_params[:username])
    if user
      if user.authenticate(auth_params[:password])
        jwt = Auth.issue({user: user.id, admin: false})
        # render json: {jwt: jwt, user_id: user.id}
        render json: {token: jwt}
      else
        render json: bad_credentials_error_response, status: 401
      end
    else
      render json: bad_credentials_error_response, status: 401
    end
  end

  def refresh
    token = params.require(:token)

    auth = Auth.decode(token)

    # user = current_user
    user = User.find(auth["user"])
    if user
      jwt = Auth.issue({user: user.id})
      render json: {token: jwt}
    else
      render json: {error: "token invalid"}, status: 401
    end
  end

  private
    def auth_params
      params.require(:auth).permit(:username, :password)
    end

    def bad_credentials_error_response
      {error: "Username or password is incorrect"}
    end
end
