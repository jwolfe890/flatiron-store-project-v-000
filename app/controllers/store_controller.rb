class StoreController < ApplicationController

def index
  @categories = Category.all
  @items = Item.available_items
end 

  
end



    # describe "Item List" do
    #   it 'displays all items that have inventory' do
    #     second_item = Item.second
    #     second_item.inventory = 0
    #     second_item.save
    #     visit store_path
    #     Item.all.each do |item|
    #       if item == second_item
    #         expect(page).to_not have_content item.title
    #       else
    #         expect(page).to have_content item.title
    #         expect(page).to have_content "$#{item.price.to_f/100}"
    #       end
    #     end
    #   end