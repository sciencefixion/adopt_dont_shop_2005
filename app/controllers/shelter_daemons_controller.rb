class ShelterDaemonsController < ApplicationController
  def index
    @shelter_daemons = Daemon.all.find_all do |daemon|
      daemon.shelter_id.to_s == params[:shelter_id]
    end
    @shelter = Shelter.find(params[:shelter_id])
  end
end
