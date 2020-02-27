class Event < ApplicationRecord
  belongs_to :guest
  belongs_to :genre
  has_many :event_members
  has_many :images
  has_many :members
  # accepts_nested_attributes_forを使うことで簡単に1対多のモデルを一度に更新するフォームを作成することできます。
  accepts_nested_attributes_for :event_members
  accepts_nested_attributes_for :images

  enum genre_id: [:meal, :date, :work, :sport, :shopping, :drive, :drinking_party, :movie, :celebration]
end
