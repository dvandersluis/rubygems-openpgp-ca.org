class UpdateUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :openpgp_key, :null => false
      t.string :rubygems_profile_page, :null => false
    end

    remove_column :users, :username
  end
end
