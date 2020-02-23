class Member < ApplicationRecord
  belongs_to :guest
  has_many :event_members
end
