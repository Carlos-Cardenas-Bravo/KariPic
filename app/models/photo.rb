# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image_url  :string
#  caption    :text
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  # devuelve la URL de la imagen, si está adjunta
  def photo_url
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
  end

  # ajusto la imagen a 800x600 manteniendo la proporción
  def resized_image
    image.variant(resize_to_fill: [800, 600]).processed
  end
end
