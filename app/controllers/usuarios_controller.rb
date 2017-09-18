class UsuariosController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :management]
  
  def index
    render :new
  end
  
  def new
    @usuario = Usuario.new
    @usuario.telefones.build
    render layout: 'blank'
  end
  
  def show
    @usuario = helpers.current_user
  end
  
  def edit
    @usuario = helpers.current_user
  end
  
  def update
    @usuario = helpers.current_user
    if @usuario.authenticate(params[:usuario][:password_atual]) and @usuario.update_attributes(usuario_params)
      redirect_to action: 'show'
    else
      render :edit
    end
    
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      # UsuarioMailer.notificacao_email(@usuario).deliver_later Envia e-mai, deixei comentado para não floodar nos testes
      redirect_to root_url, :notice => "Cadastro realizado com sucesso! Aguarde a aprovação pela gestora."
    else
      render :new, layout: 'blank'
    end
  end
  
  #Gerenciar perfis (construindo ainda...)
  def management
    @usuario = helpers.current_user
    @todosusuarios ||= Usuario.where(ativo: false)
    if @todosusuarios.blank?
      flash.now[:notice] = "Não há nenhum usuário para ter o acesso liberado."
    end
  end
  
  def update_management
    @todosusuarios = Usuario.find(params[:usuario_id])
    @todosusuarios.update_attributes(ativo: true)
    redirect_to action: 'management'
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
  private
  def logged_in_user
    unless helpers.logged_in?
      flash[:danger] = "Por favor realize o login."
      redirect_to root_url
    end
  end
end
