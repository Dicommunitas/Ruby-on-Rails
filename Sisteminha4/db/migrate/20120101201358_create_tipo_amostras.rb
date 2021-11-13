class CreateTipoAmostras < ActiveRecord::Migration
  def change
    create_table :tipo_amostras do |t|
      t.string :descricao, :null => false

      t.timestamps
    end
  end
end
