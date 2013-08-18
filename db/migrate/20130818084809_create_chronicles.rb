class CreateChronicles < ActiveRecord::Migration
  def change
    create_table :chronicles do |t|
      t.date :date
      t.text :summary
      t.string :mood

      t.timestamps
    end
  end
end
