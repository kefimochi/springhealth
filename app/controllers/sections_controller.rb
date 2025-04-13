class SectionsController < ActionController::Base
  # Dirty solution for not dealing with auth
  protect_from_forgery with: :null_session

  def index
    @sections = Section.all
    render json: SectionBlueprint.render(@sections)
  end

  def show
    id = params.extract_value(:id)
    @section = Section.find_by! id: id
    render json: SectionBlueprint.render(@section)
  end

  def create
    @section = Section.create!(sections_params)
    render json: SectionBlueprint.render(@section)
  end

  def update
    id = params.extract_value(:id)
    @section = Section.find_by! id: id

    @section.update!(sections_params)
    render json: SectionBlueprint.render(@section)
  end

  private

  def sections_params
    params.expect(section: [:text])
  end
end
