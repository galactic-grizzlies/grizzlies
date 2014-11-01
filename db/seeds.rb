require "json"

products_json = JSON.parse(File.read("db/seeds/products.json"))

products_json.each do |product_data|
  Product.create!(product_data.merge({
    image: File.open("db/seeds/product_images/#{product_data["image"]}")
  }))
end
