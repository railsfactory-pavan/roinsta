class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :show_images, :add_images, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.all.with_attached_images

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

  # GET /photos/:id/show_images
  def show_images
    if @photo&.images&.attached?

      @photo.images.map do |image|
        return redirect_to rails_blob_url(image)
      end

    else
      render json: 'Album dose not have images', status: :unauthorized
    end
  end

  # POST /photos
  def create
    @photo = Photo.new post_id: params[:post_id],
                       user_id: @current_user.id

    if @photo.save
      if params[:io].present? and params[:filename].present? and params[:content_type].present?
        @photo.images.attach io: File.open(params[:io]),
                             filename: params[:filename],
                             content_type: params[:content_type]
      end

      render_success_response({
        photo: single_serializer.new(@photo, each_serializer: PhotosSerializer)
      }, 'Photo created successfully')
    else
      render_unprocessable_entity_response(@photo)
    end
  end

  # POST /photos/:id/add_many
  def add_images
    if @photo.present?
      if params[:io].present? and params[:filename].present? and params[:content_type].present?
          @photo.images.attach io: File.open(params[:io]),
                               filename: params[:filename],
                               content_type: params[:content_type]

        render_success_response({
          photo: single_serializer.new(@photo, each_serializer: PhotosSerializer)
        }, 'Image attached successfully')
      else
        render_unprocessable_entity_response(@photo)
      end
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update post_id: params[:post_id],
                     user_id: @current_user.id
      if @photo.images.attached?
        if params[:io].present? or params[:filename].present? or params[:content_type].present?
          @photo.images.attach io: File.open(params[:io]),
                               filename: params[:filename],
                               content_type: params[:content_type]
        end
      end

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
