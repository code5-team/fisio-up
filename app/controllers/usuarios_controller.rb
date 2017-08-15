class UsuariosController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  
  def index
    @usuario = Usuario.new
    render :new
  end
  
  def new
    @usuario = Usuario.new
    @usuario.telefones.build
  end
  
  def show
    @usuario = helpers.current_user #Usuario.find(params[:id])
  end
  
  def edits
    @usuario = Usuario.find(params[:id])
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
       helpers.log_in @usuario
       flash[:notice] = "Usuário cadastrado com sucesso!"
       redirect_to action: 'show', id: @usuario
    else
      render :new
    end
  end
  
  #Faz logout e redireciono
  def destroy
      helpers.log_out
      redirect_to root_url
  end
  
  #Parametros necessários para realizar a criação de um usuário
  private
  def usuario_params
    params.require(:usuario).permit(:nome, :email, :crefito, :datanascimento, :password, :password_confirmation, telefones_attributes: [:id, :numero])
  end
  
  #Confirma se o usuário está logado
  def logged_in_user
    unless helpers.logged_in?
      flash[:danger] = "Por favor realize o login."
      redirect_to action: 'new'
    end
  end
end
