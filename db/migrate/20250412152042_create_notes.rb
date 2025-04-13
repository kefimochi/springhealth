class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :status, null: false
      t.belongs_to :appointement

      t.timestamps
    end
  end
end
