class NoteBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :status

  association :section, blueprint: SectionBlueprint
end