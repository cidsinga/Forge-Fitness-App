class Workout < ApplicationRecord
  has_many :exercise_entries, dependent: :destroy

  accepts_nested_attributes_for :exercise_entries,
    allow_destroy: true,
    reject_if: :blank_exercise_entry?

  private

  def blank_exercise_entry?(attributes)
    attributes["movement_id"].blank? &&
      attributes["sets"].blank? &&
      attributes["reps"].blank? &&
      attributes["weight"].blank? &&
      attributes["notes"].blank?
  end
end