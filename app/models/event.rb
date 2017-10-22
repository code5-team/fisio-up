class Event < ApplicationRecord
  belongs_to :usuario, inverse_of: :events
  belongs_to :unidade
end
