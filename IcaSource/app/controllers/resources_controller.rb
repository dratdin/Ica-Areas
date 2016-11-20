class ResourcesController < ApplicationController
  include CurrentArea

  before_filter :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @current_area = current_area
  end

  # GET /resources/new_link
  def new_link
    @current_area = current_area
    @resource = Resource.new
    @selected_resource_type = "Link"
  end

  # GET /resources/new_image
  def new_image
    @current_area = current_area
    @resource = Resource.new
    @selected_resource_type = "Image"
  end

  # GET /resources/new_text
  def new_text
    @current_area = current_area
    @resource = Resource.new
    @selected_resource_type = "Text"
  end

  # GET /resources/1/edit
  def edit
    @current_area = current_area
  end

  # POST /resources
  # POST /resources.json
  def create
    # @resource = Resource.new(resource_params)
    # @resource.resource_type = @selected_resource_type
    # @resource.area_id = current_area.id
    @resource = current_area.resources.create(resource_params)
    respond_to do |format|
      if @resource.save
        format.html { redirect_to current_area }
        format.json { }
      else
        @current_area = current_area
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to current_area }
        format.json { }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to current_area }
      format.json { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :text_content, :description, :image_url, :file, :addition_file)
    end
end
