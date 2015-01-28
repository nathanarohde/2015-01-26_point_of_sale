class Purchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:product_id, :int)
      t.column(:customer_name, :string)
    end
  end
end
