class EventsController < ApplicationController
  
  def index
    @usuario = helpers.current_user
  end
  
  def new
    @event = Event.new
    @event.usuario.build
    @event.unidade.build
    render layout: 'blank'
  end
  
  def create
    @event = Event.new(event_params)
  end
  
  
  private 
  
end
