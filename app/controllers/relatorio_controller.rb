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
    @membro = Usuario.find(@get['usuario'])
    @datainicio = @get['datainicio']
    @datafim = @get['datafim']

    @plantoes = find_plantao(@membro, @datainicio, @datafim)

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

  def find_plantao(usuario, data_inicio, data_fim)
    data_inicio = DateTime.parse(data_inicio, '%Y-%m-%dT%H:%M:%S')
    data_fim = DateTime.parse(data_fim, '%Y-%m-%dT%H:%M:%S').change({hour: 23, minute: 59, second: 59})

    return Event.where("usuario_id = ? AND start >= ? AND start <= ?", usuario.id, data_inicio, data_fim)
  end
end
