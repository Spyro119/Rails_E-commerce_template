class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  authorize_resource :class => false
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json

  def index
    time = params[:time]
    # @produxts_for_man = Product.where(:id => params[:sexe])
    @products = Product.where(:created_at => params[:time]... Time.now)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @cart_action = @product.cart_action current_user.try :id
    jsonProduct = @product.to_json
    
    # render json: @product
  end

  # GET /products/new
  def new
    redirect_to rails_admin.new_path('product')
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    redirect_to rails_admin.edit_path('product')

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Le product a été créer avec succès.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Le product a été modifié avec succès.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Le product a été supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.fetch(:product, {})
    end


end