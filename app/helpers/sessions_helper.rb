module SessionsHelper
  
  #Metódo responsável em logar o usuário na sessão
  def log_in(usuario)
    session[:usuario_id] = usuario.id
    session[:tempo_logado] = Time.now + 20.minutes
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
    if !current_user.nil? & (session[:tempo_logado] < Time.now)
      log_out
    else
      !current_user.nil?
    end
  end
  
  def is_admin?
    #avaliar a logica depois...
    if usuario.admin == 1
      true
    else
      false
    end
  end
  
end
