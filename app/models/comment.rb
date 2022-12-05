# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  comment          :text
#  role             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_roles_id :integer
#
class Comment < ApplicationRecord
  belongs_to(:company_roles, { :required => true, :class_name => "CompanyRole", :foreign_key => "company_roles_id" })
end
