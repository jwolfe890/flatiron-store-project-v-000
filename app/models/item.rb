class Item < ActiveRecord::Base


has_many :carts, through: :line_items
has_many :line_items


belongs_to :category

def self.available_items
  Item.where("inventory > ?", 0)
end 

end
