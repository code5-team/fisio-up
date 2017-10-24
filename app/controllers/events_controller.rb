class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :show]
  
  def index
    @events = Event.all #Event.where(start: params[:start]..params[:end], unidade_id: params[:unidade_id])
    @usuario = helpers.current_user
  end
  
  def show

  end
  
  def new
    @usuario = helpers.current_user
    @data_atual = params[:start]
    @event = Event.new
  end
  
  def edit
     @usuario = helpers.current_user
  end
  
  def create
    eventoParametro = event_params
    horarioinicial = DateTime.parse(eventoParametro[:start],'%Y-%m-%dT%H:%M:%S' )
    atendimento = eventoParametro[:atendimento]
    
    if atendimento == '1' #Atendimento matutino
      eventoParametro[:start] = horarioinicial + 7.hours
      eventoParametro[:end] = eventoParametro[:start]  + 12.hours
    elsif atendimento == '2' #Atendimento vespertino
      eventoParametro[:start] = horarioinicial + 19.hours
      eventoParametro[:end] = eventoParametro[:start]  + 12.hours
    else
      eventoParametro[:start] = horarioinicial + 8.hours
      eventoParametro[:end] = eventoParametro[:start]  + 9.hours
    end
    
    @event = Event.new(eventoParametro)
    @event.save
  end

  def update
    @usuario = helpers.current_user
    @event.update(event_params)
  end
  
  private 
  def event_params
    params.require(:event).permit(:title, :start, :end, :observaco, :usuario_id, :atendimento,:unidade_id => 1)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
