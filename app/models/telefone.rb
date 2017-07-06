class Telefone < ApplicationRecord
  belongs_to :usuario, inverse_of: :telefones #Inverse_of evita consulta no banco para recuperar o objeto, recupero da memória. 
end
