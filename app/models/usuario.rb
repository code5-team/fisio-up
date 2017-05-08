class Usuario < ApplicationRecord
  belongs_to :status_usuario
  has_many :telefone
  belongs_to :tipo_usuario
  
  #Expressão regular que valida o e-mail para o model
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true ,:format => EMAIL_REGEX
  validates :datanascimento, presence: true
  validates :crefito, presence: true
end
