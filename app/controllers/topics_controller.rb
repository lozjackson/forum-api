class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
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

  # PATCH/PUT /topics/1
  def update
    if @topic.user == current_user
      if @topic.update(topic_params)
        render json: @topic
      else
        render json: @topic.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end

  # DELETE /topics/1
  def destroy
    if @topic.user == current_user
      @topic.destroy
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:title, :body, :user])
    end
end
