class DaemonsController < ApplicationController
  def index
    @daemons = Daemon.all
  end

  def show
    @daemon = Daemon.find(params[:id])
  end
end
