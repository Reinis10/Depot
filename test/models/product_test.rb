class ProductTest < ActiveSupport::TestCase
	fixtures :products
test "product price must be positive" do
	
	product = Product.new(title: "Closet", 
							description: "Your best friend at hiding things",
							image_url:"g.gif")
	
	product.price = -1
	assert product.invalid?
	assert_equal ["must be greater than or equal to 0.01"],
		product.errors[:price]

	product.price = 0
	assert product.invalid?
	assert_equal ["must be greater than or equal to 0.01"],
		product.errors[:price]

	product.price = 1
	assert product.valid?
end

def new_product(image_url)
	Product.new(title:"Couch", 
				description:"Good for your back and your bottom-side", 
				price: 149.99, 
				image_url: image_url)
end

test "image_url" do
	
	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg 
			http://a.b.c/x/y/z/fred.gif }
	bad = %w{ fred.doc fred.gif/more fred.gif.more }

	ok.each do |name|
		assert new_product(name).valid?, "#{name} should be valid"
	end

	bad.each do |name|
		assert new_product(name).invalid?, "#{name} shouldn't be valid"
	end
end

test "product is not valid without a unique title - i18n" do
	product = Product.new(title: products(:ruby).title,
							description: "Words go here",
							price: 1,
							image_url: "h.gif")
	
	assert product.invalid?
	assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
end
end





