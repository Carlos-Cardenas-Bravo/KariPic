# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer          default("normal_user")
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image

  def profile_image_url
    Rails.application.routes.url_helpers.rails_blob_url(profile_image, only_path: true) if profile_image.attached?
  end

  def resized_profile_image
    profile_image.variant(resize_to_fill: [200, 200]).processed if profile_image.attached?
  end

  # Define los roles con enum
  enum :role, { normal_user: 0, admin: 1 }

  # Validaciones
  validates :role, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
