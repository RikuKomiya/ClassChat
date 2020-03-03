# == Schema Information
#
# Table name: examples
#
#  id         :bigint           not null, primary key
#  color      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Example < ApplicationRecord
end
