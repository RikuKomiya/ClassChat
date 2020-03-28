# == Schema Information
#
# Table name: universities
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  name_kana  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_universities_on_name  (name) UNIQUE
#
class University < ApplicationRecord

  has_many :users
  has_many :lectures
  has_many :facluties

end
