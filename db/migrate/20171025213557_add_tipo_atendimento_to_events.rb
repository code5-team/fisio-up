class AddTipoAtendimentoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tipo_atendimento, :int
  end
end
