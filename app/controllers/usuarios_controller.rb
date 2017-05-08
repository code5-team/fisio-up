class UsuariosController < ApplicationController
  def novo
    @usuario = Usuario.new
  end
end
