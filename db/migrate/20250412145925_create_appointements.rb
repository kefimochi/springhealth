class CreateAppointements < ActiveRecord::Migration[8.0]
  def change
    create_table :appointements do |t|
      t.timestamp :end_time, null: false
      t.timestamp :start_time, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
