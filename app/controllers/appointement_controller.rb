class AppointementController < ActionController::Base
  def index
    @appointements = Appointement.all
    render json: AppointementBlueprint.render(@appointements)
  end
end
