# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  text       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :bigint           not null
#
class Message < ApplicationRecord
  belongs_to :lecture
end
