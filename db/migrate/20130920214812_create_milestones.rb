class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.references :challenge, index: true
      t.date :date
      t.boolean :completed, default: false
      t.text :comment

      t.timestamps
    end
  end
end
