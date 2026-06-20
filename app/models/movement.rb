class Movement < ApplicationRecord
  before_validation :normalize_tag
  has_many :exercise_entries, dependent: :restrict_with_error


  validates :name, presence: true
  validates :tag,
    uniqueness: true,
    allow_blank: true,
    format: {
      with: /\A[A-Z][A-Za-z0-9]*\z/,
      message: "should use UpperCamelCase, like BenchPress"
    }

  private

  def normalize_tag
    self.tag = tag.to_s.delete_prefix("#").strip.presence
  end
end