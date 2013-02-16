class AddReconfirmable < ActiveRecord::Migration
  def up
    add_column :users, :unconfirmed_email, :string
    add_column :keys, :unconfirmed_email, :string
  end

  def down
    remove_column :users, :unconfirmed_email, :string
    remove_column :keys, :unconfirmed_email, :string
  end
end
