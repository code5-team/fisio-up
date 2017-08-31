class UsuarioMailer < ApplicationMailer
  default from: 'code5.development@gmail.com'
  
  def notificacao_email(usuario)
    @usuario = usuario
    @url = 'http://fisioup.herokuapp.com/'
    mail(to: 'matheus.oliveira@msn.com', subject: 'Novo Fisioterapeuta Cadastrado - FisioUp')
  end
end
