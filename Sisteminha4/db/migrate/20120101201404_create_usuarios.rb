class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :chave, :null => false
      t.string :nome, :null => false
      t.string :nome_guerra, :null => false
      t.string :observacao
      t.string :senha, :null => false
      t.references :privilegio, :null => false

      t.timestamps
    end
    add_index :usuarios, :privilegio_id
  end
end
