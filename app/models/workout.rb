class Workout < ApplicationRecord
  validates :date, presence: true
  validates :raw_notes, presence: true
end
