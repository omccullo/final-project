class CompanyRolesController < ApplicationController
  def index
    matching_company_roles = CompanyRole.all

    @list_of_company_roles = matching_company_roles.order({ :created_at => :desc })

    render({ :template => "company_roles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_company_roles = CompanyRole.where({ :id => the_id })

    @the_company_role = matching_company_roles.at(0)

    render({ :template => "company_roles/show.html.erb" })
  end

  def create
    the_company_role = CompanyRole.new
    the_company_role.name = params.fetch("query_name")
    the_company_role.full_part_time = params.fetch("query_full_part_time")
    the_company_role.interview_question_entries_count = params.fetch("query_interview_question_entries_count")
    the_company_role.interview_formats_entries_count = params.fetch("query_interview_formats_entries_count")

    if the_company_role.valid?
      the_company_role.save
      redirect_to("/company_roles", { :notice => "Company role created successfully." })
    else
      redirect_to("/company_roles", { :alert => the_company_role.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_company_role = CompanyRole.where({ :id => the_id }).at(0)

    the_company_role.name = params.fetch("query_name")
    the_company_role.full_part_time = params.fetch("query_full_part_time")
    the_company_role.interview_question_entries_count = params.fetch("query_interview_question_entries_count")
    the_company_role.interview_formats_entries_count = params.fetch("query_interview_formats_entries_count")

    if the_company_role.valid?
      the_company_role.save
      redirect_to("/company_roles/#{the_company_role.id}", { :notice => "Company role updated successfully."} )
    else
      redirect_to("/company_roles/#{the_company_role.id}", { :alert => the_company_role.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_company_role = CompanyRole.where({ :id => the_id }).at(0)

    the_company_role.destroy

    redirect_to("/company_roles", { :notice => "Company role deleted successfully."} )
  end
end
