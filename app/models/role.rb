# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many(:interview_question_entries, { :class_name => "InterviewQuestionEntry", :foreign_key => "role_id", :dependent => :destroy })
end
