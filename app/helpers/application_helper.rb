module ApplicationHelper
  def display_products(selected_category)
    category = Category.find(selected_category.id)
    category.products
  end

  def current_user_id
    session[:user_id] = User.find(session["warden.user.user.key"][0][0]).id
  end

  def calculate_price(order)
    order.quantity * order.product.list_price
  end
end
