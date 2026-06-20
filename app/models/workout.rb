class Workout < ApplicationRecord
  validates :date, presence: true
  validates :raw_notes, presence: true

  has_many :exercise_entries, dependent: :destroy
end
