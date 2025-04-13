class NotesController < ActionController::Base
  # Dirty solution for not dealing with auth
  protect_from_forgery with: :null_session

  def index
    @notes = Note.all
    render json: NoteBlueprint.render(@notes)
  end

  def show
    id = params.extract_value(:id)
    @note = Note.find_by! id: id
    render json: NoteBlueprint.render(@note)
  end

  def create
    @note = Note.create!(note_params)
    render json: NoteBlueprint.render(@note)
  end

  def update
    id = params.extract_value(:id)
    @note = Note.find_by! id: id

    @note.update!(note_params) if can_update?
    render json: NoteBlueprint.render(@note)
  end

  private

  def note_params
    params.expect(notes: [:title, :start_time, :end_time])
  end

  def can_update?
    @note.status == "Draft"
  end
end
