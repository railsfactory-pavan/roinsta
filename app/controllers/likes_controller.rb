class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    @like = Like.new post_id: params[:post_id],
                     user_id: @current_user.id

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update post_id: params[:post_id],
                    user_id: @current_user.id

      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    if @like.destroy
      render json: 'Like deleted', status: :ok
    end
  end

  private
  
  def set_like
    @like = Like.find(params[:id])
  end
end
