class AppointementsController < ActionController::Base
  def index
    @appointements = Appointement.all
    render json: AppointementBlueprint.render(@appointements)
  end

  def show
    id = params.extract_value(:id)
    @appointement = Appointement.find(id)
    render json: AppointementBlueprint.render(@appointement)
  end

  def create
    @appointement = Appointement.create!(appointement_params)
    render json: AppointementBlueprint.render(@appointement)
  end

  def update
    id = params.extract_value(:id)
    @appointement = Appointement.find(id)
    @appointement.update!(appointement_params)
    render json: AppointementBlueprint.render(@appointement)
  end

  private

  def appointement_params
    params.expect(:title, :start_time, :end_time)
  end
end
