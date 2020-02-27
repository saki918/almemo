class Member < ApplicationRecord
  belongs_to :guest
  has_many :event_members
  has_many :events

  validates :name, presence: true
end
