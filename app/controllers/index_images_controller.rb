class IndexImagesController < ApplicationController
  before_action :set_index_image, only: [:show, :edit, :update, :destroy]
  authorize_resource :class => false

  # GET /index_images
  # GET /index_images.json
  def index
    redirect_to root_url
    @index_images = IndexImage.all
  end

  # GET /index_images/1
  # GET /index_images/1.json
  def show
  end

  # GET /index_images/new
  def new
    # if user? && !user_signed_in?
    redirect_to rails_admin.new_path('IndexImage')
  # end

  #  if possible, maybe another way to create AND view the result ?
    @index_image = IndexImage.new
  end

  # GET /index_images/1/edit
  def edit
    redirect_to rails_admin.edit_path('IndexImage')
  end

  # POST /index_images
  # POST /index_images.json
  def create
    @index_image = IndexImage.new(index_image_params)

    respond_to do |format|
      if @index_image.save
        format.html { redirect_to @index_image, notice: 'Index image was successfully created.' }
        format.json { render :show, status: :created, location: @index_image }
      else
        format.html { render :new }
        format.json { render json: @index_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /index_images/1
  # PATCH/PUT /index_images/1.json
  def update
    respond_to do |format|
      if @index_image.update(index_image_params)
        format.html { redirect_to @index_image, notice: 'Index image was successfully updated.' }
        format.json { render :show, status: :ok, location: @index_image }
      else
        format.html { render :edit }
        format.json { render json: @index_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /index_images/1
  # DELETE /index_images/1.json
  def destroy
    @index_image.destroy
    respond_to do |format|
      format.html { redirect_to index_images_url, notice: 'Index image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index_image
      @index_image = IndexImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def index_image_params
      params.fetch(:index_image, {}).permit(:titre, :description, :image)
    end
end
