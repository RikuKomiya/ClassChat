# == Schema Information
#
# Table name: lectures
#
#  id             :bigint           not null, primary key
#  day_of_week    :integer          not null
#  name           :string(255)      not null
#  period         :integer          not null
#  professor_name :string(255)      not null
#  sem            :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
