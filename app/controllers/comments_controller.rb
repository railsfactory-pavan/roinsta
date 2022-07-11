class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new body: params[:body],
                           user_id: @current_user.id,
                           post_id: params[:post_id]

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update body: params[:body],
                       user_id: @current_user.id,
                       post_id: params[:post_id]

      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.destroy
      render json: 'Comment deleted', status: :ok
    end
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
