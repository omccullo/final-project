# == Schema Information
#
# Table name: interview_formats_entries
#
#  id         :integer          not null, primary key
#  round      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  format_id  :integer
#
class InterviewFormatsEntry < ApplicationRecord
  belongs_to(:company_role, { :required => true, :class_name => "CompanyRole", :foreign_key => "company_id", :counter_cache => true })
  belongs_to(:format, { :required => true, :class_name => "InterviewFormat", :foreign_key => "format_id" })
end
