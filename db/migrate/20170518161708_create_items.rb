

class CreateItems < ActiveRecord::Migration[5.1]
  def change

    create_table :items do |t|
      t.string :title  # This will create VARCHAR(50) in Postgres
      t.text :body     # This will create TEXT in Postgres
      t.timestamps
    end
  end
end
