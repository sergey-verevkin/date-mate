class SignificantDate < ApplicationRecord
  belongs_to :datable, polymorphic: true

  enum variety: [:birthday, :anniversary, :holiday]

  validates :month, :day, presence: true

  scope :natural_order, -> { order(:month, :day) }

  def display_name
    "(#{variety}) #{month}/#{day} - #{datable.display_name}"
  end
end
