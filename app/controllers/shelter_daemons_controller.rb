class ShelterDaemonsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:shelter_id])
    @shelter_daemons = Daemon.all.find_all do |daemon|
      daemon.shelter_id.to_s == params[:shelter_id]
    end
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    daemon = @shelter.daemons.create!(shelter_daemons_params)
    redirect_to "/shelters/#{@shelter.id}/daemons"
  end

  private

  def shelter_daemons_params
    params.permit(:image, :name, :description, :approximate_age, :sex)
  end
end
