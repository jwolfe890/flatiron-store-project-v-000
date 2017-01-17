class Cart < ActiveRecord::Base


has_many :items, through: :line_items
has_many :line_items

belongs_to :user

def total
    self.items.inject(0){|sum,x| sum + x.price }
end 

def actual_total
    real_total = []
    self.line_items.each do |item|
        if item.quantity > 1
            item1 = Item.find_by(id: item.item_id)
            item_price = item1.price * item.quantity
            real_total << item_price
        else
            item1 = Item.find_by(id: item.item_id)
            real_total << item1.price
        end
    end
    real_total.inject(0){|sum,x| sum + x }
end


def add_item(item)

    if self.line_items.include?(LineItem.find_by(item_id: item, cart_id: self.id))
        LineItem.find_by(item_id: item, cart_id: self.id)
    else 
        line_item2 = self.line_items.build(item_id: item, cart_id: self.id)

        line_item2
    end 
  end


def add_item2(item)
    if self.items.include?(Item.find_by(id: item))
        @line_item = LineItem.find_by(item_id: item, cart_id: self.id)
        @line_item.quantity = @line_item.quantity + 1
        @line_item.save
        @line_item
    else 
        self.items << Item.find_by(id: item)
        self.items.last
    end
end 

# def add_item(item)
#     if self.line_items.include?(LineItem.find_by(item_id: item, cart_id: self.id))
#         @line_item = LineItem.find_by(item_id: item, cart_id: self.id)
#         @line_item.quantity = @line_item.quantity + 1
#         @line_item.save
#         @line_item
#     else 
#         self.items << Item.find_by(id: item)
#         self.items.last
#     end
# end  

    # describe "#add_item" do
    # it 'creates a new unsaved line_item for new item' do
    #   second_item = Item.second
    #   second_line_item = @cart.add_item(second_item.id)
    #   expect(second_line_item.new_record?).to be_truthy
    # end

    # it 'creates an appropriate line_item' do
    #   second_item = Item.second
    #   second_line_item = @cart.add_item(second_item.id)
    #   expect(second_line_item.quantity).to eq(1)
    #   expect(second_line_item.item_id).to eq(second_item.id)
    #   expect(second_line_item.cart_id).to eq(@cart.id)
    # end

    # it 'updates existing line_item instead of making new when adding same item' do 
    #   @line_item2 = @cart.add_item(@item.id)
    #   @line_item2.save
    #   expect(@line_item.id).to eq(@line_item2.id)
    # end


end
