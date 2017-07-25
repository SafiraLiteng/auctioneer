class AddIndexesToItems < ActiveRecord::Migration[5.1]
  def change
    add_index :items, :title
    add_index :items, :body
  end
end
