class AddViewCountToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :view_count, :integer
  end
end
