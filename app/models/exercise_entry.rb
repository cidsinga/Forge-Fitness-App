class ExerciseEntry < ApplicationRecord
  belongs_to :workout
  belongs_to :movement

  has_many :exercise_sets, -> { order(:set_number) }, dependent: :destroy

accepts_nested_attributes_for :exercise_sets,
  allow_destroy: true,
  reject_if: :blank_exercise_set?

  validates :sets, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :reps, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  scope :ordered, -> { order(:position, :created_at) }

  def summary
    if exercise_sets.loaded? || exercise_sets.exists?
      exercise_sets.map do |exercise_set|
        weight_part =
          if exercise_set.weight.present?
            "#{exercise_set.weight.to_f.round(2)} lb"
          end

        [weight_part, "#{exercise_set.reps} reps"].compact.join(" × ")
      end.join(", ")
    else
      parts = []
      parts << "#{sets} sets" if sets.present?
      parts << "#{reps} reps" if reps.present?
      parts << "#{weight.to_f.round(2)} lb" if weight.present?
      parts.join(" × ")
    end
  end

  private

def blank_exercise_set?(attributes)
  attributes["weight"].blank? && attributes["reps"].blank?
end
end
