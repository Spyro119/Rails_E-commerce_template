class SizeColorsController < ApplicationController
  before_action :set_size_color, only: [:show, :edit, :update, :destroy]
  authorize_resource :class => false

  # GET /size_colors
  # GET /size_colors.json
  def index
    @size_colors = SizeColor.all
  end

  # GET /size_colors/1
  # GET /size_colors/1.json
  def show
  end

  # GET /size_colors/new
  def new
    @size_color = SizeColor.new
  end

  # GET /size_colors/1/edit
  def edit
  end

  # POST /size_colors
  # POST /size_colors.json
  def create
    @size_color = SizeColor.new(size_color_params)

    respond_to do |format|
      if @size_color.save
        format.html { redirect_to @size_color, notice: 'Size color was successfully created.' }
        format.json { render :show, status: :created, location: @size_color }
      else
        format.html { render :new }
        format.json { render json: @size_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /size_colors/1
  # PATCH/PUT /size_colors/1.json
  def update
    respond_to do |format|
      if @size_color.update(size_color_params)
        format.html { redirect_to @size_color, notice: 'Size color was successfully updated.' }
        format.json { render :show, status: :ok, location: @size_color }
      else
        format.html { render :edit }
        format.json { render json: @size_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /size_colors/1
  # DELETE /size_colors/1.json
  def destroy
    @size_color.destroy
    respond_to do |format|
      format.html { redirect_to size_colors_url, notice: 'Size color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size_color
      @size_color = SizeColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def size_color_params
      params.fetch(:size_color, {})
    end
end
