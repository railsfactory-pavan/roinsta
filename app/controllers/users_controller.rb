class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    if @users.present?
      render_success_response({
        users: single_serializer.new(@users, each_serializer: UsersSerializer)
      }, 'Users fetched successfully')
    else
      render_unprocessable_entity('Users not found') unless @users.present?
    end
  end

  # GET /users/1
  def show
    render_success_response({
      user: single_serializer.new(@user, serializer: UsersSerializer)
    }, 'User fetched successfully')
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render_success_response({
        user: single_serializer.new(@user, each_serializer: UsersSerializer)
      }, 'Users created successfully')
    else
      render_unprocessable_entity_response(@user)
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render_success_response({
        user: single_serializer.new(@user, each_serializer: UsersSerializer)
      }, 'Users updated successfully')
    else
      render_unprocessable_entity_response(@user)
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      render_success_response({
        user: {}
      }, 'User destroyed successfully')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    render_unprocessable_entity('User not found') unless @user.present?
  end

  def user_params
    params.permit(:email, :password, :full_name, :user_name, :about, :avatar, :followers_count, :following_count)
  end
end
