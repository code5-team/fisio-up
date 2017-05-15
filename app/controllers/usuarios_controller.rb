class UsuariosController < ApplicationController
  
  
  def index
    @usuario = Usuario.new
    render :new
  end
  
  def new
    @usuario = Usuario.new
  end
  
  def show
    @usuario = Usuario.find(params[:id])
  end
  
  def edit
    @usuario = Usuario.find(params[:id])
  end
  
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.password = params[:password]
    
    if @usuario.save
       flash[:notice] = "Usuário cadastrado com sucesso!"
       redirect_to @usuario
    else
      render :new
    end
  end
  
  #Parametros necessários para realizar a criação de um usuário
  private
  def usuario_params
    params.require(:usuario).permit(:nome, :email, :crefito, :datanascimento, :password)
  end
  
end
