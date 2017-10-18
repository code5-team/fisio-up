class AddObsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :observaco, :string
  end
end
