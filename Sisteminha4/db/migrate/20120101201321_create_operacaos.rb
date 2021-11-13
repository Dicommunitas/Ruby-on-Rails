class CreateOperacaos < ActiveRecord::Migration
  def change
    create_table :operacaos do |t|
      t.string :descricao, :null => false

      t.timestamps
    end
  end
end
