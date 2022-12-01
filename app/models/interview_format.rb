# == Schema Information
#
# Table name: interview_formats
#
#  id                   :integer          not null, primary key
#  behavioral           :string
#  case                 :string
#  duration             :string
#  number_of_interviews :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class InterviewFormat < ApplicationRecord
end
