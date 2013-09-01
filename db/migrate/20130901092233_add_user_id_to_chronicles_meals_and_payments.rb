class AddUserIdToChroniclesMealsAndPayments < ActiveRecord::Migration
  def change
    add_column :chronicles, :user_id, :integer
    add_column :meals,      :user_id, :integer
    add_column :payments,   :user_id, :integer
  end
end
