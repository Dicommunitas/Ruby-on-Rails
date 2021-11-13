class ChangeDescricaoFromProdutos < ActiveRecord::Migration
  def change
    change_table :produtos do |t|
      t.rename :descricao, :nome_curto
    end
  end
  add_column :produtos, :nome_completo, :string
end
