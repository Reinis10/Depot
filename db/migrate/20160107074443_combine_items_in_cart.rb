class CombineItemsInCart < ActiveRecord::Migration
  def up
  	Cart.all.each do |cart|
  		sums = cart.line_items.group(:product_id).sum(:quantity)	# count the number of each product in the cart

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				cart.line_items.where(product_id: product_id).delete_all	# remove individual items

  				item = cart.line_items.build(product_id: product_id)		# replace with a single item
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end

  def down
  	LineItem.where("quantity > 1").each do |line_item|		# split items with quantity > 1 into multiple items
  		
  		line_item.quantity.times do 								
  			LineItem.create cart_id: line_item.cart_id, 
          product_id: line_item.product_id, quantity: 1		# add individual items
  		end

  	line_item.destroy			# remove the original item
  	end
end
end
