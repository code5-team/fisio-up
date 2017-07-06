class UsuariosController < ApplicationController
  
  
  def index
    @usuario = Usuario.new
    render :new
  end
  
  def new
    @usuario = Usuario.new
    @usuario.telefones.build
  end
  
  def show
    @usuario = Usuario.find(params[:id])
  end
  
  def edits
    @usuario = Usuario.find(params[:id])
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
       flash[:notice] = "Usuário cadastrado com sucesso!"
       redirect_to action: 'show', id: @usuario
    else
      render :new
    end
  end
  
  #Parametros necessários para realizar a criação de um usuário
  private
  def usuario_params
    params.require(:usuario).permit(:nome, :email, :crefito, :datanascimento, :password, :password_confirmation, telefones_attributes: [:id, :numero])
  end
  
end
