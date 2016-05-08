require 'faker'

20.times do
  Product.create(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, list_price: Faker::Commerce.price, img_link:"http://www.muslimholidays.net/wp-content/uploads/2014/04/shop-placeholder-1024x1024.png" ,quantity: rand(20))
end

5.times do
  Category.create(name: Faker::Commerce.department)
end

c1 = Category.first
c2 = Category.second

counter = 1
while counter < 17
  p = Product.find(counter)
  p.categories << c1
  p.categories << c2
  counter += 1
end

# User.create(email: "tom@tom.com", password: "tomtom")
# Admin.create(first_name: 'tim', last_name: 'tim', email: 'tim@tim.com', password: 'timtim')
