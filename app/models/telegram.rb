class Telegram < ApplicationRecord
  has_and_belongs_to_many :categories
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader
end
