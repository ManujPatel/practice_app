class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new 
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to products_path
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to new_product_path
    end

  end

  def show  
  end

  def edit 
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

end
