class CreateLacres < ActiveRecord::Migration
  def change
    create_table :lacres do |t|
      t.integer :numero
      t.references :amostra, :null => false
      t.references :finalidade, :null => false

      t.timestamps
    end
    add_index :lacres, :amostra_id
    add_index :lacres, :finalidade_id
  end
end
