# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :events
  mount_uploader :icon_id, ImageUploader
end
