class CreateProblemas < ActiveRecord::Migration
  def change
    create_table :problemas do |t|
      t.string :descricao, :null => false

      t.timestamps
    end
  end
end
