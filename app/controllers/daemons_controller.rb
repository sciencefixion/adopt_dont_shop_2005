class DaemonsController < ApplicationController
  def index
    @daemons = Daemon.all
  end
end
