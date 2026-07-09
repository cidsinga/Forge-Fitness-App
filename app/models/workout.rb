class Workout < ApplicationRecord
  has_many :exercise_entries, dependent: :destroy

  accepts_nested_attributes_for :exercise_entries,
    allow_destroy: true,
    reject_if: :blank_exercise_entry?

  private

  def blank_exercise_entry?(attributes)
    exercise_sets_blank =
      attributes["exercise_sets_attributes"].blank? ||
      attributes["exercise_sets_attributes"].values.all? do |set_attributes|
        set_attributes["weight"].blank? && set_attributes["reps"].blank?
      end

    attributes["movement_id"].blank? &&
      attributes["sets"].blank? &&
      attributes["reps"].blank? &&
      attributes["weight"].blank? &&
      attributes["notes"].blank? &&
      exercise_sets_blank
  end
end