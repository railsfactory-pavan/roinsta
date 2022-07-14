class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    if @comments.present?
      render_success_response({
        comments: single_serializer.new(@comments, each_serializer: CommentsSerializer)
      }, 'Comments fetched successfully')
    else
      render_unprocessable_entity('Comments not found') unless @comments.present?
    end
  end

  # GET /comments/1
  def show
    render_success_response({
      comment: single_serializer.new(@comment, serializer: CommentsSerializer)
    }, 'Comment fetched successfully')
  end

  # POST /comments
  def create
    @comment = Comment.new body: params[:body],
                           user_id: @current_user.id,
                           post_id: params[:post_id]

    if @comment.save
      render_success_response({
        comment: single_serializer.new(@comment, each_serializer: CommentsSerializer)
      }, 'Comment created successfully')
    else
      render_unprocessable_entity_response(@comment)
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update body: params[:body],
                       user_id: @current_user.id,
                       post_id: params[:post_id]

      render_success_response({
        comment: single_serializer.new(@comment, each_serializer: CommentsSerializer)
      }, 'Comment updated successfully')
    else
      render_unprocessable_entity_response(@comment)
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.destroy
      render_success_response({
        comment: {}
      }, 'Comment destroyed successfully')
    end
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
    render_unprocessable_entity('Comment not found') unless @comment.present?
  end
end
