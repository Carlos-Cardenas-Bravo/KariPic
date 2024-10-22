# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  url            :string
#  imageable_type :string           not null
#  imageable_id   :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
