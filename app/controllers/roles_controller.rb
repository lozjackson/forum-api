class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update]

  def index
    if params[:name]
      @role = Role.find_by(name: params[:name])
      render json: @role
    else
      @roles = Role.all
      render json: @roles
    end
  end

  def show
    render json: @role
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      render json: @role, status: :created
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: {error: "unauthorized"}, status: :forbidden
  end

  private

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name])
    end
end
