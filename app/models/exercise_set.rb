class ExerciseSet < ApplicationRecord
  belongs_to :exercise_entry

  validates :set_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :reps, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
end