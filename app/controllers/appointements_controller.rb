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
    unless has_conflicts?(appointement_params)
      @appointement = Appointement.create!(appointement_params)
      render json: AppointementBlueprint.render(@appointement)
    else
      payload = {
        error: "Cant schedule with a meeting overlap!",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  def update
    id = params.extract_value(:id)
    @appointement = Appointement.find_by! id: id

    unless has_conflicts?(appointement_params)
      @appointement.update!(appointement_params)
      render json: AppointementBlueprint.render(@appointement)
    else
      payload = {
        error: "Cant schedule with a meeting overlap!",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  private

  def appointement_params
    params.expect(appointement: [:title, :start_time, :end_time])
  end

  def has_conflicts?(incoming)
    # Couldn't think of a way to accomplish early return using active records, sadly
    has_conflicts = false

    Appointement.all.each do |app|
      app_start_time = app.start_time.to_datetime
      app_end_time = app.end_time.to_datetime
      incoming_start_time = DateTime.parse(incoming[:start_time].to_s)
      incoming_end_time = DateTime.parse(incoming[:end_time].to_s)

      if app_start_time == incoming_start_time || app_end_time == incoming_end_time
        has_conflicts = true
        break 
      end

      if (app_start_time < incoming_end_time && incoming_end_time < app_end_time) || (app_end_time > incoming_start_time && incoming_start_time > app_start_time)
        has_conflicts = true
        break 
      end
    end
    has_conflicts
  end
end
