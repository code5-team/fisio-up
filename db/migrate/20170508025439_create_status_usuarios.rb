class CreateStatusUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :status_usuarios do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
