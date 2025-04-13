class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.string :text, null: false
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
