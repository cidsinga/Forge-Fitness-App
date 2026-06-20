class ExerciseEntry < ApplicationRecord
  belongs_to :workout
  belongs_to :movement

  validates :sets, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :reps, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  scope :ordered, -> { order(:position, :created_at) }

  def summary
    parts = []
    parts << "#{sets} sets" if sets.present?
    parts << "#{reps} reps" if reps.present?
    parts << "#{weight.to_f.round(2)} lb" if weight.present?
    parts.join(" × ")
  end
end