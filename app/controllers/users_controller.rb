class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :avatar, :update, :destroy]

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

  def avatar
    if @user&.avatar&.attached?

      redirect_to rails_blob_url(@user.avatar)
    else
      render json: 'User dose not have a avatar', status: :unauthorized
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)    

    if @user.save
      if params[:io].present? and params[:filename].present? and params[:content_type].present?
        @user.avatar.attach io: File.open(params[:io]),
                            filename: params[:filename],
                            content_type: params[:content_type]
      end

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
      if @user.avatar.attached?
        if params[:io].present? or params[:filename].present? or params[:content_type].present?
          @user.avatar.attach io: File.open(params[:io]),
                              filename: params[:filename],
                              content_type: params[:content_type]
        end
      end

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
    params.permit(:email, :password, :full_name, :user_name, :about)
  end
end
