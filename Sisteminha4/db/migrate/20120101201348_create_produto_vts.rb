class CreateProdutoVts < ActiveRecord::Migration
  def change
    create_table :produto_vts do |t|
      t.string :certificado, :null => false
      t.references :descricao_produto, :null => false

      t.timestamps
    end
    add_index :produto_vts, :descricao_produto_id
  end
end
