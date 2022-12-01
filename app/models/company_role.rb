# == Schema Information
#
# Table name: company_roles
#
#  id                               :integer          not null, primary key
#  full_part_time                   :string
#  interview_formats_entries_count  :integer
#  interview_question_entries_count :integer
#  name                             :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
class CompanyRole < ApplicationRecord
  has_many(:interview_question_entries, { :class_name => "InterviewQuestionEntry", :foreign_key => "company_roles_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "company_roles_id", :dependent => :destroy })
  has_many(:interview_formats_entries, { :class_name => "InterviewFormatsEntry", :foreign_key => "company_id", :dependent => :destroy })
end
