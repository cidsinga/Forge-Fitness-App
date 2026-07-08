class BackfillExerciseSetsFromExerciseEntries < ActiveRecord::Migration[8.1]
  class MigrationExerciseEntry < ApplicationRecord
    self.table_name = "exercise_entries"
  end

  class MigrationExerciseSet < ApplicationRecord
    self.table_name = "exercise_sets"
  end

  def up
    MigrationExerciseEntry.find_each do |entry|
      sets_count = entry.sets.to_i
      reps_count = entry.reps.to_i

      next if sets_count <= 0
      next if reps_count <= 0

      sets_count.times do |index|
        MigrationExerciseSet.find_or_create_by!(
          exercise_entry_id: entry.id,
          set_number: index + 1
        ) do |exercise_set|
          exercise_set.weight = entry.weight
          exercise_set.reps = reps_count
        end
      end
    end
  end

  def down
    MigrationExerciseSet.delete_all
  end
end