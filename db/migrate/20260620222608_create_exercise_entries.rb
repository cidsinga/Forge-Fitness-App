class CreateExerciseEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :exercise_entries do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :movement, null: false, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.decimal :weight, precision: 8, scale: 2
      t.text :notes
      t.integer :position

      t.timestamps
    end
  end
end