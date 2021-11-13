class CreateVistorias < ActiveRecord::Migration
  def change
    create_table :vistorias do |t|
      t.date :data, :null => false
      t.references :vt, :null => false

      t.timestamps
    end
    add_index :vistorias, :vt_id
  end
end
