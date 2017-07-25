class AddUserToBiddrs < ActiveRecord::Migration[5.1]
  def change
    add_reference :biddrs, :user, foreign_key: true
  end
end
