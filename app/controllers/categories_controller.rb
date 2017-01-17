class CategoriesController < ApplicationController

def show
  @category = Category.find_by(id: params[:id])
end


end

 # 10) Feature Test: Category Item List lists all of the items in that category
 #      Failure/Error: expect(page).to have_content "$#{item.price.to_f/100}"
 #        expected to find text "$85.54" in 
 # "sign in Sign up Store Home Movies & Outdoors Sleek Silk Shirt"