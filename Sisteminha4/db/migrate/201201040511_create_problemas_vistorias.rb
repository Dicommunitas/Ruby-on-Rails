class CreateProblemasVistorias < ActiveRecord::Migration
  # sem model somente tabela de ligação
  def change
    create_table :problemas_vistorias do |t|
      t.references :problema
      t.references :vistoria

      t.timestamps
    end
    add_index :problemas_vistorias, :problema_id
    add_index :problemas_vistorias, :vistoria_id
  end
end
