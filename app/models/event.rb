# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :guest
  belongs_to :genre
  has_many :event_members
  has_many :images
  has_many :members, through: :event_members
  # accepts_nested_attributes_forを使うことで簡単に1対多のモデルを一度に更新するフォームを作成することできます。
  accepts_nested_attributes_for :event_members
  accepts_nested_attributes_for :images

  validates :title, presence: true
  validates :start_time, presence: true

  default_scope -> { order(start_time: :asc) }

  # enum genre_id: [:meal, :date, :work, :sport, :shopping, :drive, :drinking_party, :movie, :celebration]
end
