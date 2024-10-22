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
#  role                   :integer
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy

  # Método para acceder a la URL de la imagen de perfil
  def profile_image_url
    image&.url
  end

  # Define los roles con enum
  enum role: { normal_user: 0, admin: 1 }

  # Validaciones
  validates :role, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
