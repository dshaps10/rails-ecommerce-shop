class PurchasesController < ApplicationController

  def index
    @purchases = Order.where(purchased: true).reverse
  end

end
