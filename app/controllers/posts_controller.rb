class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :can_edit_post, only: :update
  before_action :can_delete_post, only: :destroy

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

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:body, :topic, :user])
    end

    def can_edit_post
      render json: {error: "You are not authorized to edit this post"}, status: :forbidden if @post.user != current_user && !current_user.is_admin? && !current_user.has_role?(:moderator)
    end

    def can_delete_post
      render json: {error: "You are not authorized to delete this post"}, status: :forbidden if @post.user != current_user && !current_user.is_admin? && !current_user.has_role?(:moderator)
    end
end
