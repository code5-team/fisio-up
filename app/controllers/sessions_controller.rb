class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    usuario = Usuario.where(email: params[:email]).first
    
    if usuario && usuario.authenticate(params[:password])
      login_usuario!(usuario)
    else
      flash.now[:error] = "Login ou senha inválidos"
      redirect_to 
    end
  end
  
  
  private
  def login_user!(usuario)
    session[:usuario_id] = user.id
    flash[:notice] = "Bem-vindo, você está logado!"
    redirect_to root_path
  end
  
end
