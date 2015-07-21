# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Base products
products = Product.create!(
  [
    {
      name: "A big hat",
      price: 50.00
    },
    {
      name: "A big bag",
      price: 100.00
    },
    {
      name: "A fancy dog",
      price: 20.00
    },
    {
      name: "A fancy car",
      price: 10.00
    }
  ]
)

line_items = [
  {quantity: 2, price: products[0].price, product_id: products[0].id },
  {quantity: 1, price: products[1].price, product_id: products[1].id },
  {quantity: 3, price: products[2].price, product_id: products[2].id },
]

Order.create!(
  [
    { email: "mario@gmail.com", line_items_attributes: line_items },
    { email: "juan@gmail.com", line_items_attributes: line_items },
    { email: "pedro@gmail.com", line_items_attributes: line_items },
    { email: "luis@gmail.com", line_items_attributes: line_items },
    { email: "alfredo@gmail.com", line_items_attributes: line_items },
    { email: "rodrigo@gmail.com", line_items_attributes: line_items },
    { email: "armando@gmail.com", line_items_attributes: line_items },
    { email: "enrique@gmail.com", line_items_attributes: line_items },
    { email: "jesus@gmail.com", line_items_attributes: line_items },
    { email: "luis@gmail.com", line_items_attributes: line_items },
    { email: "eduardo@gmail.com", line_items_attributes: line_items },
    { email: "arnoldo@gmail.com", line_items_attributes: line_items },
  ]
)
