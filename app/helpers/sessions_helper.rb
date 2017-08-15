module SessionsHelper
  
  #Metódo responsável em logar o usuário na sessão
  def log_in(usuario)
    session[:usuario_id] = usuario.id
  end
  
  #Destruo a sessão
  def log_out
    session.delete(:usuario_id)
    @current_user = nil
  end
  
  #Crio a variável usuário atual de acordo com a sessão
  def current_user
    @current_user ||= Usuario.find_by(id: session[:usuario_id])
  end

  #Identifico se o usuário está logado, retornando TRUE ou FALSE.
  def logged_in?
    !current_user.nil?
  end
  
end
