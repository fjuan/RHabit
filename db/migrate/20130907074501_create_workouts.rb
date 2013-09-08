class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.datetime :datetime
      t.integer :duration, default: 0
      t.string :sport
      t.string :where
      t.text :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
