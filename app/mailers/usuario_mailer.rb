class UsuarioMailer < ApplicationMailer
  default from: 'code5.development@gmail.com'
  
  def notificacao_email(usuario)
    @usuario = usuario
    @url = 'http://fisioup.herokuapp.com/'
    mail(to: 'matheus.oliveira@msn.com', subject: 'Novo Fisioterapeuta Cadastrado - FisioUp')
  end
  
  def reset_password(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: "Reset da senha - FisioUp")
  end
  
end
