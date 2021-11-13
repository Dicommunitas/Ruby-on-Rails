class ChangeNumeroDeControleFromNotaVts < ActiveRecord::Migration
  def change
    change_table :nota_vts do |t|
      t.rename :numero_de_controle, :numero_v2
    end
  end
end
