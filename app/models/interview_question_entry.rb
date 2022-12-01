# == Schema Information
#
# Table name: interview_question_entries
#
#  id               :integer          not null, primary key
#  frequency        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_roles_id :integer
#  question_id      :integer
#  role_id          :integer
#
class InterviewQuestionEntry < ApplicationRecord
end
