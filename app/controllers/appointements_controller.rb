class AppointementsController < ActionController::Base
  # Dirty solution for not dealing with auth
  protect_from_forgery with: :null_session

  def index
    @appointements = Appointement.all
    render json: AppointementBlueprint.render(@appointements)
  end

  def show
    id = params.extract_value(:id)
    @appointement = Appointement.find_by! id: id
    render json: AppointementBlueprint.render(@appointement)
  end

  def create
    puts appointement_params[:start_time]
    @appointement = Appointement.create!(appointement_params)
    render json: AppointementBlueprint.render(@appointement)
  end

  def update
    id = params.extract_value(:id)
    @appointement = Appointement.find_by! id: id

    @appointement.update!(appointement_params) if can_schedule?
    render json: AppointementBlueprint.render(@appointement)
  end

  private

  def appointement_params
    params.expect(appointement: [:title, :start_time, :end_time])
  end

  def can_schedule?
    puts @appointement
    puts Appointement.all.inspect
    puts "hello world"
  end
end
