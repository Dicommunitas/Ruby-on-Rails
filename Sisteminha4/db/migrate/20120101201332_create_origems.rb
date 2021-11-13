class CreateOrigems < ActiveRecord::Migration
  def change
    create_table :origems do |t|
      t.string :descricao, :null => false

      t.timestamps
    end
  end
end
