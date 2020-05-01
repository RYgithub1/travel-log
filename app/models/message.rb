class Message < ApplicationRecord

  belongs_to :group
  belongs_to :user

  validates :content, presence: true, unless: :image?
  # if: :image?ならimageカラムが空でなければ、よりif not

  mount_uploader :image, ImageUploader


end

