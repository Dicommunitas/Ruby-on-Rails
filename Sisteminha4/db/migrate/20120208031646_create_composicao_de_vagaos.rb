class CreateComposicaoDeVagaos < ActiveRecord::Migration
  def change
    create_table :composicao_de_vagaos do |t|
      t.datetime :entrada_plataforma
      t.datetime :inicio_descarga
      t.datetime :final_descarga
      t.datetime :saida_plataforma
      t.integer  :temperatura
      t.string   :tanque_destino
      t.boolean  :utilizou_vapor
      t.text     :observacao
      t.references :responsavel, :null => false
      t.references :fechamento_diario_vagao, :null => false
      
      t.timestamps
    end
    add_index :composicao_de_vagaos, :responsavel_id
    add_index :composicao_de_vagaos, :fechamento_diario_vagao_id
  end
end
