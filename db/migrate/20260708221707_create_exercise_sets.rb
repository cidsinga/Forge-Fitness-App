class CreateExerciseSets < ActiveRecord::Migration[8.1]
  def change
    create_table :exercise_sets do |t|
      t.references :exercise_entry, null: false, foreign_key: true
      t.integer :set_number, null: false
      t.decimal :weight, precision: 8, scale: 2
      t.integer :reps, null: false

      t.timestamps
    end

    add_index :exercise_sets, [:exercise_entry_id, :set_number], unique: true
  end
end