class CreateFinalidades < ActiveRecord::Migration
  def change
    create_table :finalidades do |t|
      t.string :descricao, :null => false

      t.timestamps
    end
  end
end
