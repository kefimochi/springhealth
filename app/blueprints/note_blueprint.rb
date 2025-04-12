class NoteBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :status

  association :sections, blueprint: SectionsBlueprint
end