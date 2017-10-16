class CreateUnidades < ActiveRecord::Migration[5.0]
  def change
    create_table :unidades do |t|
      t.string :nome
      t.string :localizacao
      t.references :tipo_unidade, foreign_key: true

      t.timestamps
    end
  end
end
