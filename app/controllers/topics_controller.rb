class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]
  before_action :can_edit_topic, only: :update
  before_action :can_delete_topic, only: :destroy

  def index

    # filter by search query
    if params[:search]
      @topics = Topic.search(params[:search])
    else
      @topics = Topic.all
    end

    # order by created_at
    @topics = @topics.includes(:posts).reorder("posts.created_at DESC").order("topics.created_at DESC")

    # paginate
    if params[:page]
      @topics = @topics.page(params[:page]).per(params[:per_page])
      render json: @topics, include: ['posts'], meta: pagination(@topics)
    else
      render json: @topics, include: ['posts']
    end
  end

  # GET /topics/1
  def show
    render json: @topic
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)
    if @topic.user == current_user
      if @topic.save
        render json: @topic, status: :created, location: @topic
      else
        render json: @topic.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end

  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
  end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:title, :body, :user])
    end

    def can_edit_topic
      render json: {error: "You cannot edit this topic"}, status: :forbidden if @topic.user != current_user && !current_user.is_admin?
    end

    def can_delete_topic
      render json: {error: "You cannot delete this topic"}, status: :forbidden if @topic.user != current_user && !current_user.is_admin?
    end
end
