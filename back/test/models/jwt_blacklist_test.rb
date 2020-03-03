# == Schema Information
#
# Table name: jwt_blacklists
#
#  id  :bigint           not null, primary key
#  exp :datetime         not null
#  jti :string(255)      not null
#
# Indexes
#
#  index_jwt_blacklists_on_jti  (jti)
#
require 'test_helper'

class JwtBlacklistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
