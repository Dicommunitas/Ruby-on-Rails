class CreateVts < ActiveRecord::Migration
  def change
    create_table :vts do |t|
      t.string :numero_curto, :null => false
      t.string :identificacao_completa, :null => false
      t.boolean :vt_carregado, :default => false, :null => false

      t.timestamps
    end
  end
end
