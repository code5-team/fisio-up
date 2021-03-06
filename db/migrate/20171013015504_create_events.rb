class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :editable
      t.references :unidade, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
