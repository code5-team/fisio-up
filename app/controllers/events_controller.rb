class EventsController < ApplicationController
  
  def index
    @events = Event.all
    #@events = Event.where(unidade_id: 1)
  end
  
  def new
    @todasunidades = Unidade.all
    @usuario = helpers.current_user
    @event = @usuario.events.build
    #@usuario.events.build
  end
  
  def create
    @usuario = helpers.current_user
    @event = @usuario.event.build(event_params)
    if @event.save
      #implementar...
    end
  end
  
  private 
  #falta terminar...
  def event_params
    params.require(:event).permit(:title, :start, :end, :usuario_id => @usuario.id)
  end
  
end
