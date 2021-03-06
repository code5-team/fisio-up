module SessionsHelper
  
  #Metódo responsável em logar o usuário na sessão
  def log_in(usuario)
    session[:usuario_id] = usuario.id
    session[:tempo_logado] = Time.now + 1.month
    session[:admin] = usuario.admin
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
    if !session[:tempo_logado].nil? and session[:tempo_logado] < Time.now
      log_out
    end
    !current_user.nil?
  end
  
  def is_admin?
    #avaliar a logica depois...
    if !session[:admin].nil? and session[:admin] == true
      true
    else
      false
    end
  end
  
end
