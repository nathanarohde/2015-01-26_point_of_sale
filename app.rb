require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/product')
require('pg')

get('/') do
  @Products = Product.all()
  erb(:index)
end

post('/products') do
  name = params['name']
  price = paramas ['price']
  product = Product.create({:name => name, :price => price})
  @Products = Product.all()
  redirect('/')
end
