# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :event
  mount_uploader :refile_id, ImageUploader
end
