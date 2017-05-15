require 'bcrypt'
class Usuario < ApplicationRecord
  include BCrypt
  
  validates_presence_of :nome, :email, :crefito, :datanascimento
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
  message: "Formato de e-mail não valido" }
  validates_uniqueness_of :email
  
  #Metódos para criptografar a senha, documentação: https://github.com/codahale/bcrypt-ruby/tree/master
  def password
    @password ||= Password.new(password_digest)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
  
end
