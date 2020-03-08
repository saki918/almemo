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
  validates :finish_time, presence: true
  validate :start_end_check

  def start_end_check
      errors.add(:finish_time,'   終了時間の日付、時間を開始時間後の日付と時間になるように記入してください。') unless
      start_time < finish_time
  end

  default_scope -> { order(start_time: :asc) }

  # enum genre_id: [:meal, :date, :work, :sport, :shopping, :drive, :drinking_party, :movie, :celebration]
end
