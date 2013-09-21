class AddUseChallengesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :use_challenges, :boolean, default: true
  end
end
