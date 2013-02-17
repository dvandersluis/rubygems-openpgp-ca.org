class ApplicationStatusInfo < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :status, :default => 0
      t.string :status_note
    end
  end
end
