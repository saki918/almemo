class Genre < ApplicationRecord
  mount_uploader :icon_id , ImageUploader
end
