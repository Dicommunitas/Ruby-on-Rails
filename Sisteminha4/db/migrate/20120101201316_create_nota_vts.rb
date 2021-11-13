class CreateNotaVts < ActiveRecord::Migration
  def change
    create_table :nota_vts do |t|
      t.integer :numero_de_controle, :null => false
      t.date :data, :null => false
      t.references :responsavel, :null => false

      t.timestamps
    end
    add_index :nota_vts, :responsavel_id
  end
end
