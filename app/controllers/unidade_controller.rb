class UnidadeController < ApplicationController
  def index
    @usuario = helpers.current_user
    @tipo_unidade = TipoUnidade.all
    @todasunidades = Unidade.all
  end

  def new
    @usuario = helpers.current_user
    @tipo_unidade = TipoUnidade.all
    @unidade = Unidade.new
  end

  def edit
    @usuario = helpers.current_user
    @tipo_unidade = TipoUnidade.all
    @unidade = Unidade.find(params[:id])
  end

  def update
    @usuario = helpers.current_user
    @unidade = Unidade.find(params[:id])

    if @unidade.update_attributes(unidade_params)
      redirect_to unidade_path, :notice => "Unidade atualizada com sucesso!"
    else
      render :edit
    end
  end

  def create
    @usuario = helpers.current_user
    @tipo_unidade = TipoUnidade.all
    @unidade = Unidade.new(unidade_params)

    if @unidade.save
      redirect_to unidade_path, :notice => "Unidade cadastrada com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    Unidade.find(params[:id]).destroy
    redirect_to unidade_path, :notice => "Unidade deletada com sucesso!"
  end

  private
  def unidade_params
    params.require(:unidade).permit(:nome, :localizacao, :tipo_unidade_id, :oitohoras, :dozehoras)
  end
end
