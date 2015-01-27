class Purchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:product_id, :int)
    end
  end
end
