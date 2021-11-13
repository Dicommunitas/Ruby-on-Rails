class CreateAmostras < ActiveRecord::Migration
  def change
    create_table :amostras do |t|
      t.datetime :data
      t.string :certificado_Ilab
      t.integer :numero_gerado_Labware
      t.text :observacao
      t.references :responsavel, :null => false
      t.references :operacao, :null => false
      t.references :origem, :null => false
      t.references :tipo_amostra, :null => false
      t.references :produto, :null => false

      t.timestamps
    end
    add_index :amostras, :responsavel_id
    add_index :amostras, :operacao_id
    add_index :amostras, :origem_id
    add_index :amostras, :tipo_amostra_id
    add_index :amostras, :produto_id
  end
end
