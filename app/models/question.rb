# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  has_many(:interview_question_entries, { :class_name => "InterviewQuestionEntry", :foreign_key => "question_id", :dependent => :destroy })
end
