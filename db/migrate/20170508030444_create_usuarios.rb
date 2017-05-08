class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :senha_criptografada
      t.date :datanascimento
      t.string :crefito
      t.references :tipo_usuario, foreign_key: true
      t.references :status_usuario, foreign_key: true

      t.timestamps
    end
  end
end
