# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :guest
  has_many :event_members
  has_many :events, through: :event_members

  validates :name, presence: true
end
