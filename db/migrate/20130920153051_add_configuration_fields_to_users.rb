class AddConfigurationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :use_meals, :boolean, default: true
    add_column :users, :use_payments, :boolean, default: true
    add_column :users, :use_workouts, :boolean, default: true
    add_column :users, :use_chronicles, :boolean, default: true
  end
end
