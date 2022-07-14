class FollowingsController < ApplicationController
  before_action :set_following, only: [:show, :update, :destroy]

  # GET /followings
  def index
    @my_followings = Following.where user_id: @current_user.id
    @my_followings_count = @my_followings.count  
    @my_followers = Following.where following_id: @current_user.id
    @my_followers_count = @my_followers.count

    if @my_followings.present? or @my_followers.present?
      render json: {
        information: 'Data fetched successfully',
        my_followings:  single_serializer.new(@my_followings, each_serializer: FollowingsSerializer),
        my_followings_count: @my_followings_count,
        my_followers: single_serializer.new(@my_followers, each_serializer: FollowingsSerializer),
        my_followers_count: @my_followers_count
      }
    else
      render_unprocessable_entity('Followings or followers not found') unless @my_followings.present? or @my_followers.present?
    end
  end

  # GET /followings/1
  def show
    render_success_response({
      like: single_serializer.new(@following, serializer: FollowingsSerializer)
    }, 'Following fetched successfully')
  end

  # POST /followings
  def create
    @following = Following.new user_id: @current_user.id,
                               following_id: params[:following_id]

    if @following.save
      render_success_response({
        following: single_serializer.new(@following, each_serializer: FollowingsSerializer)
      }, 'Following created successfully')
    else
      render_unprocessable_entity_response(@following)
    end
  end

  # PATCH/PUT /followings/1
  def update
    if @following.update user_id: @current_user.id,
                         following_id: params[:following_id]
                         
      render_success_response({
        following: single_serializer.new(@following, each_serializer: FollowingsSerializer)
      }, 'Following updated successfully')
    else
      render_unprocessable_entity_response(@following)
    end
  end

  # DELETE /followings/1
  def destroy
    if @following.destroy
      render_success_response({
        following: {}
      }, 'Following destroyed successfully')
    end
  end

  private
  
  def set_following
    @following = Following.find(params[:id])
    render_unprocessable_entity('Following not found') unless @following.present?
  end
end
