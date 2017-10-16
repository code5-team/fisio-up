class Event < ApplicationRecord
  belongs_to :usuario
  belongs_to :unidade
end
