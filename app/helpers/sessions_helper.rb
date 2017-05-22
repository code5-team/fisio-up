module SessionsHelper
  
  #Metódo responsável em recuperar o id do usuário logado, usado para auxiliar o acesso nas próximas páginas...
  def log_in(usuario)
    session[:usuario_id] = usuario.id
  end
  
end
