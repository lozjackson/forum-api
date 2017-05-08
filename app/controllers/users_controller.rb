class UsersController < ApplicationController
  before_action :set_user, except: [:index, :create]
  before_action :can_change_password, only: :change_password
  before_action :can_manage_roles, only: [:add_role, :remove_role]
  before_action :can_remove_role, only: :remove_role

  # GET /users
  def index
    @users = User.all.order("username")

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def change_password
    @user.password = params[:attributes][:password]
    @user.password_confirmation = params[:attributes][:password_confirmation]
    if !@user.password_confirmation
      render json: {error: "Password confirmation is empty"}, status: :bad_request
    else
      if @user.password && @user.save
        render json: { result: true }
      else
        render json: {errors: @user.errors.full_messages}, status: :bad_request
      end
    end
  end

  def add_role
    name = params[:name]
    if name
      @user.add_role name
      render json: @user
    else
      render json: {error: "No role name"}, status: :bad_request
    end
  end

  def remove_role
    name = params[:name]
    if name
      @user.remove_role name
      render json: @user
    else
      render json: {error: "No role name"}, status: 400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      if current_user
        trusted_parameters = [:username, :name, :email]
        if current_user.is_admin?
          trusted_parameters.push :disabled
        end
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: trusted_parameters)
      end
    end

    def can_change_password
      if User.find(params[:id]) != current_user && !current_user.is_admin?
        render json: {error: "unauthorized"}, status: :forbidden
      end
    end

    def can_manage_roles
      render json: {error: "You are not authorized to manage roles"}, status: :forbidden if !current_user.is_admin?
    end

    def can_remove_role
      render json: {error: "You cannot remove this role"}, status: :forbidden if @user == current_user && params[:name] == 'admin'
    end
end
