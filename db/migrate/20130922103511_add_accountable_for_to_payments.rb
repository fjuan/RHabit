class AddAccountableForToPayments < ActiveRecord::Migration
  def up
    add_column :payments, :accountable_for, :float
    Payment.find_each{ |payment| payment.save }
  end

  def down
    remove_column :payments, :accountable_for
  end
end
