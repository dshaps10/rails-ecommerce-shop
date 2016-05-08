class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    session[:product_id] = @product.id
  end

  def new
    @product = current_admin.posts.build
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_admin.posts.build(product_params)

    if @product.save
      flash[:success] = "You successfully listed your product!"
      redirect_to @product
    else
      flash[:danger] = "Sorry, we weren't able to list your product"
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :list_price, :quantity, :admin_id)
    end
end
