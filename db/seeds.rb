# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create!(title: 'Bed', 
	description: %{Bed is an awesome thing}, image_url: 'http://ak1.ostkcdn.com/images/products/6620948/Bedford-Black-Queen-Bed-P14188276.jpg', 
	price: 99.99)

Product.create!(title: 'Blanket', description: %{Blanket is warm}, price: 9.99,
	image_url: 'http://images.fibre2fashion.com/MemberResources/LeadResources/7/2014/3/Seller/1474155/Images/1474155_0_201403011153337096824.jpg')