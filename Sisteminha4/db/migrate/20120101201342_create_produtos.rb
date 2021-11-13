class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :descricao, :null => false
      t.string :codigo, :null => false

      t.timestamps
    end
  end
end
