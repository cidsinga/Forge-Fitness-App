class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :workout_type
      t.text :raw_notes

      t.timestamps
    end
  end
end
