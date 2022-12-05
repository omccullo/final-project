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
  has_many(:interview_formats_entries, { :class_name => "InterviewFormatsEntry", :foreign_key => "format_id", :dependent => :nullify })

  def format_description
    
  end
end
