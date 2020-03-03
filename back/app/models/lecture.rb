# == Schema Information
#
# Table name: lectures
#
#  id             :bigint           not null, primary key
#  name           :string(255)      not null
#  period         :string(255)      not null
#  professor_name :string(255)      not null
#
class Lecture < ApplicationRecord
end
