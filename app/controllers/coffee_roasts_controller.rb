class CoffeeRoastsController < ApplicationController
  before_action :set_coffee_roast, only: [:show, :update, :destroy]

  # GET /coffee_roasts
  def index
    @coffee_roasts = CoffeeRoast.page params[:page] ? params[:page].to_i : 1

    if @coffee_roasts.present?
      render_success_response({
        coffee_roasts: single_serializer.new(@coffee_roasts, each_serializer: CoffeeRoastSerializer),
        meta: pagination_meta(@coffee_roasts)
      }, 'Coffee roasts fetched successfully')
    else
      render_unprocessable_entity('Coffee roast not found') unless @coffee_roasts.present?
    end
  end

  # GET /coffee_roasts/1
  def show
    render_success_response({
      coffee_roast: single_serializer.new(@coffee_roast, serializer: CoffeeRoastSerializer)
    }, 'Coffee roast seen successfully')
  end

  # POST /coffee_roasts
  def create
    @coffee_roast = CoffeeRoast.new coffee_roast_params
      
    if @coffee_roast.save
      message = "The coffee roast '#{@coffee_roast.roast_name}' was just added"
      if params[:receiver_phone_number].present?
        TwilioTextMessenger.new(message, params[:receiver_phone_number]).call
      end

      render_success_response({
        coffee_roast: single_serializer.new(@coffee_roast, serializer: CoffeeRoastSerializer)
      }, 'Coffee roast created successfully')
    else
      render_unprocessable_entity('Coffee roast not created')
    end
  end

  # PATCH/PUT /coffee_roasts/1
  def update
    if @coffee_roast.update coffee_roast_params
      
      render_success_response({
        coffee_roast: single_serializer.new(@coffee_roast, each_serializer: CoffeeRoastSerializer)
      }, 'Coffee roast updated successfully')
    else
      render_unprocessable_entity_response(@coffee_roast)
    end
  end

  # DELETE /coffee_roasts/1
  def destroy
    if @coffee_roast.destroy
      render_success_response({
        coffee_roast: {}
      }, 'Coffee roast destroyed successfully')
    end
  end

  private

  def set_coffee_roast
    @coffee_roast = CoffeeRoast.find(params[:id])
  end

  def coffee_roast_params
    params.permit(:roast_name, :roast_description)
  end
end
