class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.references :user, index: true
      t.date :start_date
      t.date :end_date
      t.boolean :monday,    default: false
      t.boolean :tuesday,   default: false
      t.boolean :wednesday, default: false
      t.boolean :thursday,  default: false
      t.boolean :friday,    default: false
      t.boolean :saturday,  default: false
      t.boolean :sunday,    default: false

      t.timestamps
    end
  end
end
