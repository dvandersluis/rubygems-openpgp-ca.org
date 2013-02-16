class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.integer :user_id
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.timestamps
    end
  end
end
