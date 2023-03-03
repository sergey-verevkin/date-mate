class TeamMember < ApplicationRecord
  validates :first_name, :last_name, :preferred_name, presence: true

  has_one :birthday, -> { birthday }, as: :datable, class_name: 'SignificantDate', dependent: :destroy
  has_one :anniversary, -> { anniversary }, as: :datable, class_name: 'SignificantDate', dependent: :destroy

  accepts_nested_attributes_for :birthday, allow_destroy: false
  accepts_nested_attributes_for :anniversary, allow_destroy: false

  def display_name
    "#{first_name} #{last_name} (#{slack_name})"
  end
end
