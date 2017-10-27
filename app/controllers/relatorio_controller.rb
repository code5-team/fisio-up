class RelatorioController < ApplicationController
  def index
    @usuario = helpers.current_user
    @equipe = []
    for usuario in Usuario.all
      if usuario.ativo?
        @equipe.push(usuario)
      end
    end
  end

  def consulta
    @usuario = helpers.current_user
    @unidade = Unidade.all

    @get = params[:get]
    @datainicio = @get['datainicio']
    @datafim = @get['datafim']

    @with_user = params['with-user'] == '1' ? true : false
    if @with_user
      @membro = Usuario.find(@get['usuario'])
      @plantoes = find_plantao_with_user(@membro, @datainicio, @datafim)
    else
      @plantoes = find_plantao(@datainicio, @datafim)
    end
    @total_plantoes = @plantoes.length

    @total_horas = calc_horas(@plantoes)

    render 'show'
  end

  private
  def calc_horas(plantoes)
    total = 0
    for plantao in plantoes
      total += Time.diff(plantao.start, plantao.end, '%h')[:diff].to_f
    end
    return total
  end


  def find_plantao(data_inicio, data_fim)
    data_inicio = DateTime.parse(data_inicio, '%Y-%m-%dT%H:%M:%S')
    data_fim = DateTime.parse(data_fim, '%Y-%m-%dT%H:%M:%S').change({hour: 23, minute: 59, second: 59})

    return Event.where("start >= ? AND start <= ?", data_inicio, data_fim)
  end

  def find_plantao_with_user(usuario, data_inicio, data_fim)
    data_inicio = DateTime.parse(data_inicio, '%Y-%m-%dT%H:%M:%S')
    data_fim = DateTime.parse(data_fim, '%Y-%m-%dT%H:%M:%S').change({hour: 23, minute: 59, second: 59})

    return Event.where("usuario_id = ? AND start >= ? AND start <= ?", usuario.id, data_inicio, data_fim)
  end
end
