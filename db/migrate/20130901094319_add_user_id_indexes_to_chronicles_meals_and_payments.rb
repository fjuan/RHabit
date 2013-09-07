class AddUserIdIndexesToChroniclesMealsAndPayments < ActiveRecord::Migration
  def change
    add_index :chronicles, :user_id
    add_index :meals,      :user_id
    add_index :payments,   :user_id
  end
end
