class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :show, :destroy]
  
  def index
    @events = Event.where(unidade_id: params[:unidade])
    @usuario = helpers.current_user
    @unidade = params[:unidade]
    session[:unidade] = @unidade
  end
  
  def show
    @usuario = helpers.current_user
  end
  
  def destroy
    @event.destroy
  end
  
  def new
    @usuario = helpers.current_user
    @data_atual = params[:start]
    @unidade = session[:unidade]
    @data_formatada = DateTime.parse(@data_atual, '%Y-%m-%dT%H:%M:%S') + 23.hours
    @eventos ||= Event.where('usuario_id = ? AND start BETWEEN ? AND ? AND unidade_id = ?', @usuario.id, @data_atual, @data_formatada, @unidade)
    @event = Event.new
  end
  
  def edit
     @usuario = helpers.current_user
  end
  
  def create
    eventoParametro = event_params
    horarioinicial = DateTime.parse(eventoParametro[:start],'%Y-%m-%dT%H:%M:%S')
    atendimento = eventoParametro[:tipo_atendimento]
    
    cedo ='#ff6f00'
    tarde = '#424242'
    adm = '#0d47a1'
    
    if atendimento == '1' #Atendimento matutino
      eventoParametro[:start] = horarioinicial + 7.hours
      eventoParametro[:end] = eventoParametro[:start]  + 12.hours
      eventoParametro[:color] = cedo
    elsif atendimento == '2' #Atendimento vespertino
      eventoParametro[:start] = horarioinicial + 19.hours
      eventoParametro[:end] = eventoParametro[:start]  + 12.hours
      eventoParametro[:color] = tarde
    else
      eventoParametro[:start] = horarioinicial + 8.hours
      eventoParametro[:end] = eventoParametro[:start]  + 7.hours
      eventoParametro[:color] = adm
    end
    
    @event = Event.new(eventoParametro)
    @event.save
  end

  def update
    @usuario = helpers.current_user
    @unidade = session[:unidade]
    
    if @usuario.id != @event.usuario_id
      return
    end
    
    if @event.start < Date.today
      @event.update(event_params)
      return
    end
    
    cedo ='#ff6f00'
    tarde = '#424242'
    adm = '#0d47a1'
    
    eventoParametro = event_params
    horarioinicial = DateTime.parse(eventoParametro[:start],'%Y-%m-%dT%H:%M:%S').change({hour: 00, minute: 00, second: 00})
    atendimento = eventoParametro[:tipo_atendimento]
    
    if atendimento == '1' #Atendimento matutino
      eventoParametro[:start] = horarioinicial + 7.hours
      eventoParametro[:end] = eventoParametro[:start]  + 12.hours
      eventoParametro[:color] = cedo
    elsif atendimento == '2' #Atendimento vespertino
      eventoParametro[:start] = horarioinicial + 19.hours
      eventoParametro[:end] = eventoParametro[:start]  + 12.hours
      eventoParametro[:color] = tarde
    else
      eventoParametro[:start] = horarioinicial + 8.hours
      eventoParametro[:end] = eventoParametro[:start]  + 7.hours
      eventoParametro[:color] = adm
    end
    
    
    @event.update(eventoParametro)
  end
  
  private 
  def event_params
    params.require(:event).permit(:title, :start, :end, :observaco, :usuario_id, :tipo_atendimento, :color, :unidade_id)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
