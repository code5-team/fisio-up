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
    @event = Event.new
  end
  
  def edit
     @usuario = helpers.current_user
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @usuario = helpers.current_user
    @event.update(event_params)
  end
  
  private 
  def event_params
    params.require(:event).permit(:title, :start, :end , :observaco, :usuario_id, :unidade_id => 1)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
