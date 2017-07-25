class AddCurrentPriceToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :current_price, :integer
  end
end
