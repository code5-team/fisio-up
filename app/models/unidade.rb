class Unidade < ApplicationRecord

  validates_presence_of :nome, :localizacao, :tipo_unidade_id

  belongs_to :tipo_unidade
  has_many :events
end
