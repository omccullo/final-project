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
end
