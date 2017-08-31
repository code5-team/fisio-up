class PlantoesController < ApplicationController
  def index
    @usuario = helpers.current_user
  end
end