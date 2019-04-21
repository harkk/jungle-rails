module ApplicationHelper

  def order_complete_items
    @products
  end

  def order_product
    Product.find_by id: 13
  end
  
end
