require 'csv'

Product.delete_all

676.times  do
  new_prod = Product.find_or_create_by(title: Faker::Commerce.unique.product_name,
                                       price: Faker::Commerce.price,
                                       stock_quantity: Faker::Number.between(from: 1, to: 1000))
  if(new_prod.valid?)
    new_prod.save
  end
end
puts "Created #{Product.count} new products."
