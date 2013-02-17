class GetRidOfKeys < ActiveRecord::Migration
  def up
    drop_table :keys
  end

  def down
  end
end
