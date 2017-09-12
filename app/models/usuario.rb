require 'bcrypt'
class Usuario < ApplicationRecord
  include BCrypt
  attr_accessor :reset_token
  
  validates_presence_of :nome, :email, :crefito, :datanascimento
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
  message: "O Formato de e-mail não valido" }
  validates_uniqueness_of :email
  
  #Associações
  has_many :telefones, inverse_of: :usuario #Inverse_of evita consulta no banco para recuperar o objeto, recupero da memória. 
  accepts_nested_attributes_for :telefones

  #Usado para descriptografar a senha do usuario no login, usando o metodo authenticate do Bcrypt (controllers/sessions)
  has_secure_password
  
  #Atualiza os atributos de reset de senha
  def create_reset_digest
    self.reset_token = Usuario.new_token
    update_attribute(:reset_digest,  Usuario.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  #Envia o e-mail de reset de senha
  def envia_reset_password
    UsuarioMailer.reset_password(self).deliver_now
  end
  
  #Retorna um token aleatorio
  def Usuario.new_token
    SecureRandom.urlsafe_base64
  end
  
  #Retorna se já expirou o token do reset (deixei para expirar em 2 horas)
  def password_reset_expirado?
    reset_sent_at < 2.hours.ago
  end
  
  #Retorna um hash criptografado de acordo com a string recebida
  def Usuario.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  #Valido o token de reset de senha
  def token_autenticado?(token)
    return false if token.nil?
    Password.new(reset_digest).is_password?(token)
  end
  
end
