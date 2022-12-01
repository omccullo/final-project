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
end
