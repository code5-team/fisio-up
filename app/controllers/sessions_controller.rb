class SessionsController < ApplicationController
  def new
  end
  
  def create
   #Localizado o usuario pelo email, depois verifico se o usuario não é nil e a senha está correta, redireciono...
    usuario = Usuario.find_by(email: params[:session][:email].downcase)
    
    if usuario && usuario.authenticate(params[:password])
      log_in (usuario) #Recupero o id dele, através de um metódo no helper session...
      redirect_to usuario
    else
      flash.now[:error] = "Login ou senha inválidos"
      render 'new'  
    end
  end

  
end