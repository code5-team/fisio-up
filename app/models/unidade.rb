class Unidade < ApplicationRecord
  belongs_to :tipo_unidade
  has_many :events
end
