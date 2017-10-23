class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :show]
  
  def index
    @events = Event.all#Event.where(start: params[:start]..params[:end], unidade_id: params[:unidade])
  end
  
  def show

  end
  
  def new
    #@todasunidades = Unidade.all
    @usuario = helpers.current_user
    #@event = @usuario.events.build
    @event = Event.new
    #@usuario.events.build
  end
  
  def edit
     @usuario = helpers.current_user
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      render 'index'
    end
  end
  
  def update
    @usuario = helpers.current_user
    
    if @event.usuario_id != @usuario.id
      flash[:plantao] = 'Você não tem permissão de editar o plantão de outra pessoa.'
      redirect_to root_url
    else
       @event.update(event_params)
    end
    
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
