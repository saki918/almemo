class EventMember < ApplicationRecord
  belongs_to :member
  belongs_to :event
end
