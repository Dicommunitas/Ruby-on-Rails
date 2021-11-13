class CreateFechamentoDiarioVagaos < ActiveRecord::Migration
  def change
    create_table :fechamento_diario_vagaos do |t|
      t.datetime :data, :null => false

      t.timestamps
    end
  end
end
