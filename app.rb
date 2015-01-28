require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/product')
require('./lib/purchase')
require('pg')

get('/') do
  @products = Product.all()
  erb(:index)
end

get('/products') do
  @products = Product.all()
  erb(:product)
end

get('/purchases') do
  @products = Product.all()
  @purchases = Purchase.all()
  erb(:purchase)
end

post('/product_add') do
  name = params['name']
  price = params['price']
  product = Product.create({:name => name, :price => price})
  @products = Product.all()
  redirect('/products')
end

post('/purchase_result') do
  customer_name = params['customer_name']
  product_ids = params['product_ids']
  @products_list = []
  product_ids.each() do |product_id|
    @products_list.push(Product.find(product_id.to_i()))
  end
  @purchase = Purchase.create({})
  @purchase.products << @products_list
  erb(:purchase_result)
end

get('/products/:id/edit') do
  @product = Product.find(params['id'].to_i())
  erb (:product_edit)
end

patch('/products/:id') do
  name = params['name']
  price = params['price']
  @product = Product.find(params['id'].to_i())
  # product_original_name = @product.name
  # product_original_price = @product.price
  @product.update({:name => name, :price => price})
  @products = Product.all()
  redirect('/products')
end

delete('/products/:id') do
  @product = Product.find(params['id'].to_i())
  @product.delete
  @products = Product.all()
  redirect('/products')
end
