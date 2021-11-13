class AddDescricaoToSolicitacao < ActiveRecord::Migration
  def change
    add_column :solicitacaos, :descricao, :text
  end
end
