class CreateGrupoUsuarios < ActiveRecord::Migration
  def change
    create_table :grupo_usuarios do |t|
      t.string :tipo, :null => false
      t.string :descricao, :null => false

      t.timestamps
    end
  end
end
