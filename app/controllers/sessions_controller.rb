class SessionsController < ApplicationController
  before_action :find_user_by_name, only: [:create]
  before_action :find_user_by_token, only: [:refresh]
  before_action :check_account_enabled
  skip_before_action :authenticate

  def create
    if @user.authenticate(auth_params[:password])
      jwt = Auth.issue({user: @user.id, admin: @user.is_admin?})
      render json: {token: jwt}
    else
      render json: bad_credentials_error_response, status: 401
    end
  end

  def refresh
    jwt = Auth.issue({user: @user.id})
    render json: {token: jwt}
  end

  private
    def auth_params
      params.require(:auth).permit(:username, :password)
    end

    def bad_credentials_error_response
      {error: "Username or password is incorrect"}
    end

    def find_user_by_name
      @user = User.find_by(username: auth_params[:username])
      if !@user
        render json: bad_credentials_error_response, status: 401
      end
    end

    def find_user_by_token
      auth = Auth.decode(params.require(:token))
      @user = User.find(auth["user"])
      if !@user
        render json: {error: "token invalid"}, status: 401
      end
    end

    def check_account_enabled
      render json: {error: "Account disabled"}, status: 401 if @user.disabled
    end
end
