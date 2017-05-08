class CreateTelefones < ActiveRecord::Migration[5.0]
  def change
    create_table :telefones do |t|
      t.string :numero
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
