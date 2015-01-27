class AddCustomerNameToPurchases < ActiveRecord::Migration
  def change
    add_column(:purchases, :customer_name, :string)
  end
end
