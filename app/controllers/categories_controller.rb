class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  authorize_resource :class => false

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    # @category = Category.find(:id)
    @products = Array.new
    @products = Produit.where(:sexe => params[:sexe])
    @products_for_man.each do |products|
      if products.category_ids.include? @category.id
        # puts "INCLUDES IT #{products.category_ids}"
        @products.push(products)
      end 
    end
  end

  # GET /categories/new
  def new
    redirect_to rails_admin.new_path('Category')
    # @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    redirect_to rails_admin.edit_path('Category')
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'La Catégorie a été créee avec succès.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'La Catégorie a été modifiée avec succès.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'La Catégorie a été supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.fetch(:category, {})
    end
end
