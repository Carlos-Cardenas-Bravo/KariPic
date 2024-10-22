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
  has_one :image, as: :imageable, dependent: :destroy

  # Método para acceder a la URL de la imagen
  def photo_url
    image&.url
  end
end
