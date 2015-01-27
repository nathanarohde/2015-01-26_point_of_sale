require('spec_helper')

describe('#name') do
  it('gives the name of a product') do
    product = Product.create({:name => "Spam", :price => 2.50})
    expect(product.name).to(eq("Spam"))
  end
end

describe('#price') do
  it('gives the price of a product') do
    product = Product.create({:name => "Spam", :price => 2.50})
    expect(product.price).to(eq(2.50))
  end
end
