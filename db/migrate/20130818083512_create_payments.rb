class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :datetime
      t.string :category
      t.string :method
      t.boolean :shared
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end
