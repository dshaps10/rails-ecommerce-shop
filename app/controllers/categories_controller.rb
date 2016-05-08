class CategoriesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @select_products = display_products(@category)
  end

  def new
    @category = current_admin.posts.build
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = current_admin.posts.build(category_params)

    if @category.save
      flash[:success] = "You successfully created a category!"
      redirect_to @category
    else
      flash[:danger] = "Sorry, we weren't able to create your category"
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name, :admin_id)
    end
end
