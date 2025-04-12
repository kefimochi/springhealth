class AppointementBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :start_time, :end_time

  association :notes, blueprint: NoteBlueprint
end