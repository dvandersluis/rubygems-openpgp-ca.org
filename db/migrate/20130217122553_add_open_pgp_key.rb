class AddOpenPgpKey < ActiveRecord::Migration
  def change
    change_table :keys do |t|
      t.string :openpgp_key
    end
  end
end
