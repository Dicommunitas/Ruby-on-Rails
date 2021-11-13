class CreateSolicitacaos < ActiveRecord::Migration
  def change
    create_table :solicitacaos do |t|
      t.datetime :data_hora, :null => false
      t.string :responsavel_atender_solicitacao, :null => false
      t.references :composicao_de_vagao, :null => false

      t.timestamps
    end
    add_index :solicitacaos, :composicao_de_vagao_id
  end
end
