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
#  university_id  :integer          not null
#
class Lecture < ApplicationRecord
  has_many :messages
  belongs_to :university
end
