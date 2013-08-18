class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.datetime :datetime
      t.string :where
      t.string :kind
      t.string :description

      t.timestamps
    end
  end
end
