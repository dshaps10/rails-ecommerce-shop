class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user_id, purchased: nil)
  end

  def create
    order_new = Order.new(user_id: current_user_id, product_id: session[:product_id], quantity: params[:quantity])
    @orders = Order.where(user_id: current_user_id)
    order_quantity = params[:quantity].to_i
    checker = false
    if !@orders.empty?
      @orders.each do |order|
        if order.product_id == session[:product_id] && order.purchased == nil
          order.update(quantity: order.quantity + order_quantity)
          checker = true
        end
      end
      if checker == false
        order_new.save
        @orders << order_new
      end
    else
      order_new.save
    end

    if request.xhr?
      render '/orders/_index', layout: false, locals: { orders: @orders }
    else
      redirect_to '/'
    end

    # respond_to do |format|
    #   format.js
    #   format.html { redirect_to @orders, notice: 'order successfully created' }
    # end

    product = Product.find(session[:product_id])
    product.update(quantity: product.quantity - order_quantity)

  end

  def update
    orders = Order.where(user_id: current_user_id)
    orders.each do |order|
      order.update(purchased: true)
    end
    redirect_to '/orders/show'
  end
end
