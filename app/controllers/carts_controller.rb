class CartsController < ApplicationController

def show
  @current_cart = current_user.current_cart 
end 

def checkout

  current_user.current_cart.line_items.each do |line_item|
    item = Item.find_by(id: line_item.item_id)
    item.inventory = item.inventory - line_item.quantity
    item.save
  end

  current_user.current_cart = nil 

  current_user.save

  redirect_to cart_path(Cart.last.id)
end 

end


