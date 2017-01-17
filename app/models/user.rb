class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

has_many :carts

belongs_to :current_cart, :class_name => "Cart"

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable


  def create_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    save
  end

# def current_cart=(cart)
#   if cart 
#     cart.save
#     @cc = Cart.last
#   else 
#     @cc = cart
#   end
# end

# def current_cart
#   @cc
# end 


end
