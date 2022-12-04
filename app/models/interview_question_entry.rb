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
  belongs_to(:question, { :required => true, :class_name => "Question", :foreign_key => "question_id" })
  belongs_to(:company_roles, { :required => true, :class_name => "CompanyRole", :foreign_key => "company_roles_id", :counter_cache => true })
  belongs_to(:role, { :required => true, :class_name => "Role", :foreign_key => "role_id" })

  def company_questions
    questions=InterviewQuestionEntry.where({:company_roles_id=>@company_id})
    return questions    
  end
end
