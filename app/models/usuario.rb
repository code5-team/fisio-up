require 'bcrypt'
class Usuario < ApplicationRecord
  include BCrypt
  
  validates_presence_of :nome, :email, :crefito, :datanascimento
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
  message: "Formato de e-mail não valido" }
  validates_uniqueness_of :email
  
  #Associações
  has_many :telefones, inverse_of: :usuario #Inverse_of evita consulta no banco para recuperar o objeto, recupero da memória. 
  accepts_nested_attributes_for :telefones

  #Usado para descriptografar a senha do usuario no login, usando o metodo authenticate do Bcrypt (controllers/sessions)
  has_secure_password
  
end
