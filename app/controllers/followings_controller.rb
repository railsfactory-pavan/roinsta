class FollowingsController < ApplicationController
  before_action :set_following, only: [:show, :update, :destroy]

  # GET /followings
  def index
    @my_followings = Following.where user_id: @current_user.id
    @my_followings_count = @my_followings.count  
    @my_followers = Following.where following_id: @current_user.id
    @my_followers_count = @my_followers.count

    render json: {
      my_followings:  @my_followings,
      my_followings_count: @my_followings_count,
      my_followers: @my_followers,
      my_followers_count: @my_followers_count
    }
  end

  # GET /followings/1
  def show
    render json: @following
  end

  # POST /followings
  def create
    @following = Following.new user_id: @current_user.id,
                               following_id: params[:following_id]

    if @following.save
      render json: @following, status: :created, location: @following
    else
      render json: @following.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /followings/1
  def update
    if @following.update user_id: @current_user.id,
                         following_id: params[:following_id]
                         
      render json: @following
    else
      render json: @following.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followings/1
  def destroy
    if @following.destroy
      render json: 'Following deleted', status: :ok
    end
  end

  private
  
  def set_following
    @following = Following.find(params[:id])
  end
end
