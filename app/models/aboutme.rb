class Aboutme < ApplicationRecord

  validates :content, :image, :url, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

end
