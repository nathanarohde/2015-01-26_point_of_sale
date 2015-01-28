class Purchase < ActiveRecord::Base
   has_and_belongs_to_many(:products)
  serialize :product_id
end
