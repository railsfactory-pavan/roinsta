class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]

  # GET /likes
  def index
    @likes = Like.page params[:page] ? params[:page].to_i : 1

    if @likes.present?
      render_success_response({
        likes: single_serializer.new(@likes, each_serializer: LikesSerializer),
        meta: pagination_meta(@likes)
      }, 'Likes fetched successfully')
    else
      render_unprocessable_entity('Likes not found') unless @likes.present?
    end

    # paginate json: @likes, per_page: 5
  end

  # GET /likes/1
  def show
    render_success_response({
      like: single_serializer.new(@like, serializer: LikesSerializer)
    }, 'Like fetched successfully')
  end

  # POST /likes
  def create
    @like = Like.new post_id: params[:post_id],
                     user_id: @current_user.id

    if @like.save
      render_success_response({
        like: single_serializer.new(@like, each_serializer: LikesSerializer)
      }, 'Like created successfully')
    else
      render_unprocessable_entity_response(@like)
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update post_id: params[:post_id],
                    user_id: @current_user.id

      render_success_response({
        like: single_serializer.new(@like, each_serializer: LikesSerializer)
      }, 'Like updated successfully')
    else
      render_unprocessable_entity_response(@like)
    end
  end

  # DELETE /likes/1
  def destroy
    if @like.destroy
      render_success_response({
        like: {}
      }, 'Like destroyed successfully')
    end
  end

  private
  
  def set_like
    @like = Like.find(params[:id])
    render_unprocessable_entity('Like not found') unless @like.present?
  end
end
