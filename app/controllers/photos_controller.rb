class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.all

    if @photos.present?
      render_success_response({
        photos: single_serializer.new(@photos, each_serializer: PhotosSerializer)
      }, 'Photos fetched successfully')
    else
      render_unprocessable_entity('Photos not found') unless @photos.present?
    end
  end

  # GET /photos/1
  def show
    render_success_response({
      photo: single_serializer.new(@photo, serializer: PhotosSerializer)
    }, 'Photo fetched successfully')
  end

  # POST /photos
  def create
    @photo = Photo.new image: params[:image],
                       post_id: params[:post_id],
                       user_id: @current_user.id

    if @photo.save
      render_success_response({
        photo: single_serializer.new(@photo, each_serializer: PhotosSerializer)
      }, 'Photo created successfully')
    else
      render_unprocessable_entity_response(@photo)
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update image: params[:image],
                     post_id: params[:post_id],
                     user_id: @current_user.id

      render_success_response({
        photo: single_serializer.new(@photo, each_serializer: PhotosSerializer)
      }, 'Photo updated successfully')
    else
      render_unprocessable_entity_response(@photo)
    end
  end

  # DELETE /photos/1
  def destroy
    if @photo.destroy
      render_success_response({
        photo: {}
      }, 'Photo destroyed successfully')
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
    render_unprocessable_entity('Photo not found') unless @photo.present?
  end
end
