class AppointementBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :start_time, :end_time

  association :note, blueprint: NoteBlueprint
end