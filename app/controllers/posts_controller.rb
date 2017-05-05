class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    if params[:topic]
      topic = Topic.find(params[:topic])
      @posts = topic.posts
    else
      @posts = Post.all
    end

    if params[:page]
      @posts = @posts.page(params[:page]).per(params[:per_page])
      render json: @posts, meta: pagination(@posts)
    else
      render json: @posts
    end
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:body, :topic, :user])
    end
end
