# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_roles_id :integer
#  user_id          :integer
#
class Comment < ApplicationRecord
  belongs_to(:company_roles, { :required => true, :class_name => "CompanyRole", :foreign_key => "company_roles_id" })
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
end
