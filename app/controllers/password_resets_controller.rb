class PasswordResetsController < ApplicationController
before_action :get_usuario, only: [:edit, :update]
before_action :token_valido, only: [:edit, :update]
before_action :verifica_token, only: [:edit, :update]

def new
  render layout: 'blank'
end

def edit
  render layout: 'blank'
end

def create
  @usuario = Usuario.find_by(email: params[:password_reset][:email].downcase)
  if !@usuario.nil?
    @usuario.create_reset_digest
    @usuario.envia_reset_password
    flash[:info] = 'Foi enviado um e-mail com instruções para o reset de senha!'
    redirect_to root_url
  else
    flash[:danger] = 'Não foi localizado o e-mail cadastrado'
    render 'new'
  end
end

def update
  if params[:usuario][:password].empty?
    @usuario.errors.add(:password, "A senha não pode estar vazia!")
    render 'edit'
  elsif @usuario.update_attributes(usuario_params)
    helpers.log_in @usuario
    @usuario.update_attribute(:reset_digest, nil)
    flash[:success] = "A senha foi resetada!"
    redirect_to :controller => 'usuarios', :action => 'show', id: @usuario
  else
    render 'edit' 
  end
end


private

  def usuario_params
    params.require(:usuario).permit(:password, :password_confirmation)
  end
  
  def get_usuario
    @usuario = Usuario.find_by(email: params[:email].downcase)
  end
  
  def token_valido
    unless (!@usuario.nil? and @usuario.token_autenticado?(params[:id]))
      redirect_to root_url
    end
  end
  
  def verifica_token
    if @usuario.password_reset_expirado?
      flash[:danger] = 'O reset de senha expirou, solicite novamente.'
    end
  end
  
end
