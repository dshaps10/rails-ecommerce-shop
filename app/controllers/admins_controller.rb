class AdminsController < ApplicationController

  def inventory_index
    @products = Product.all
  end

  def show
    redirect_to '/admin'
  end

end
