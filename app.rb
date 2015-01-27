require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/product')
require('pg')

get('/') do
  @products = Product.all()
  erb(:index)
end

post('/products') do
  name = params['name']
  price = params['price']
  product = Product.create({:name => name, :price => price})
  @products = Product.all()
  redirect('/')
end
