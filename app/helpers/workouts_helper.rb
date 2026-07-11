module WorkoutsHelper
  def workout_movement_summary(workout)
    movements = workout.exercise_entries
                       .map(&:movement)
                       .compact
                       .map(&:name)
                       .uniq

    return "No movements logged yet." if movements.empty?

    visible_movements = movements.first(3)
    hidden_count = movements.size - visible_movements.size

    movement_text = visible_movements.join(", ")
    movement_text += " +#{hidden_count} more" if hidden_count.positive?

    "#{pluralize(movements.size, "movement")} · #{movement_text}"
  end
end