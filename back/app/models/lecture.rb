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

  enum day_of_week: { Sunday: 0, Monday: 1, Tuesday: 2, Wednesday: 3, Thursday: 4, Friday: 5, Saturday: 6 }
  enum sem: { SpringSemester: 0, FallSemester: 1 }
end
