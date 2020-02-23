class Event < ApplicationRecord
  belongs_to :guest
  belongs_to :genre
  has_many :event_members
  attachment :image, destroy: false
end
