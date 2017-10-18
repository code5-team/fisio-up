class AddHourToUnidades < ActiveRecord::Migration[5.0]
  def change
    add_column :unidades, :oitohoras, :boolean
    add_column :unidades, :dozehoras, :boolean
  end
end
