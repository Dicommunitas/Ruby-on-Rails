class CreateOperacaoComVagaos < ActiveRecord::Migration
  def change
    create_table :operacao_com_vagaos do |t|
      t.integer :peso, :null => false
      t.boolean :operacao_finalizada, :default => false, :null => false
      t.references :vt, :null => false
      t.references :nota_vt, :null => false
      t.references :produto_vt, :null => false
      t.references :composicao_de_vagao

      t.timestamps
    end
    add_index :operacao_com_vagaos, :vt_id
    add_index :operacao_com_vagaos, :nota_vt_id
    add_index :operacao_com_vagaos, :produto_vt_id
    add_index :operacao_com_vagaos, :composicao_de_vagao_id
  end
end
