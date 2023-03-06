class SignificantDate < ApplicationRecord
  belongs_to :datable, polymorphic: true

  enum variety: [:birthday, :anniversary, :holiday]

  validates :month, :day, presence: true

  def happen_on
    "#{month}/#{day}"
  end
end
