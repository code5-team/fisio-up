class SessionsController < ApplicationController
  def new
    #Se o usuário estiver logado, redireciono para o perfil
    if helpers.logged_in?
      redirect_to :controller => 'usuarios', :action => 'show'
    else
      render layout: 'blank'
    end
  end
  
  def create
   #Localizado o usuario pelo email, depois verifico se o usuario não é nil e a senha está correta, redireciono...
    usuario = Usuario.find_by(email: params[:session][:email].downcase)
    
    if !usuario.nil? && usuario.authenticate(params[:session][:password])
      helpers.log_in (usuario) #logo usuário em um metodo do helper. 
      redirect_to :controller => 'usuarios', :action => 'show', id: usuario
    else
      flash.now[:error] = 'E-mail ou senha inválidos'
      render 'new', layout: 'blank'
    end
  end

  def destroy
    helpers.log_out if helpers.logged_in?
    redirect_to root_url
  end
  
end
