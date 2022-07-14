class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    if @posts.present?
      render_success_response({
        posts: single_serializer.new(@posts, each_serializer: PostsSerializer)
      }, 'Posts fetched successfully')
    else
      render_unprocessable_entity('Posts not found') unless @posts.present?
    end
  end

  # GET /posts/1
  def show
    render_success_response({
      post: single_serializer.new(@post, serializer: PostsSerializer)
    }, 'Post fetched successfully')
  end

  # POST /posts
  def create
    @post = Post.new location: params[:location],
                     user_id: @current_user.id

    if @post.save
      render_success_response({
        post: single_serializer.new(@post, each_serializer: PostsSerializer)
      }, 'Post created successfully')
    else
      render_unprocessable_entity_response(@post)
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update location: params[:location],
                    user_id: @current_user.id

      render_success_response({
        post: single_serializer.new(@post, each_serializer: PostsSerializer)
      }, 'Post updated successfully')
    else
      render_unprocessable_entity_response(@post)
    end
  end

  # DELETE /posts/1
  def destroy
    if @post.destroy
      render_success_response({
        post: {}
      }, 'Post destroyed successfully')
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
    render_unprocessable_entity('Post not found') unless @post.present?
  end
end
