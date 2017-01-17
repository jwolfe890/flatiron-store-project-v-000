class LineItemsController < ApplicationController


def create

  # binding.pry

  item = Item.find_by(id: params[:item_id])

  if current_user.current_cart
      current_user.current_cart.add_item2(item)
  else
     current_user.create_current_cart
     current_user.current_cart.add_item2(item)
  end
  redirect_to cart_path(current_user.current_cart.id)
end


#   if current_user.current_cart && LineItem.find_by(item_id: params[:item_id], cart_id: current_user.current_cart.id)
#     @item2 = LineItem.find_by(item_id: item, cart_id: current_user.current_cart.id)
#     @item2.quantity = @item2.quantity + 1
#     @item2.save
#     current_user.current_cart.items << item

#   elsif current_user.current_cart
#      current_user.current_cart.add_item(item)
#      current_user.current_cart.items << item
#   else
#      current_user.create_current_cart
#      current_user.current_cart.add_item(item)
#   end
#   redirect_to cart_path(current_user.current_cart.id)
# end

  # cart = Cart.new(user_id: current_user.id)
  
  # @user = User.find_by(id: current_user.id)

  # current_user.create_current_cart

  # current_user.save

  # binding.pry

  # current_user.current_cart.add_item(params[:id])






end
