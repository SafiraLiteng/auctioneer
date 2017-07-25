class CreateBiddrs < ActiveRecord::Migration[5.1]
  def change
    create_table :biddrs do |t|
      t.integer :bid
      t.references :item, foreign_key: true, index: true

      t.timestamps
    end
  end
end
