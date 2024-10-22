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
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
