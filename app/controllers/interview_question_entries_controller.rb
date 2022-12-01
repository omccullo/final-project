class InterviewQuestionEntriesController < ApplicationController
  def index
    matching_interview_question_entries = InterviewQuestionEntry.all

    @list_of_interview_question_entries = matching_interview_question_entries.order({ :created_at => :desc })

    render({ :template => "interview_question_entries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interview_question_entries = InterviewQuestionEntry.where({ :id => the_id })

    @the_interview_question_entry = matching_interview_question_entries.at(0)

    render({ :template => "interview_question_entries/show.html.erb" })
  end

  def create
    the_interview_question_entry = InterviewQuestionEntry.new
    the_interview_question_entry.question_id = params.fetch("query_question_id")
    the_interview_question_entry.company_roles_id = params.fetch("query_company_roles_id")
    the_interview_question_entry.role_id = params.fetch("query_role_id")
    the_interview_question_entry.frequency = params.fetch("query_frequency")

    if the_interview_question_entry.valid?
      the_interview_question_entry.save
      redirect_to("/interview_question_entries", { :notice => "Interview question entry created successfully." })
    else
      redirect_to("/interview_question_entries", { :alert => the_interview_question_entry.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interview_question_entry = InterviewQuestionEntry.where({ :id => the_id }).at(0)

    the_interview_question_entry.question_id = params.fetch("query_question_id")
    the_interview_question_entry.company_roles_id = params.fetch("query_company_roles_id")
    the_interview_question_entry.role_id = params.fetch("query_role_id")
    the_interview_question_entry.frequency = params.fetch("query_frequency")

    if the_interview_question_entry.valid?
      the_interview_question_entry.save
      redirect_to("/interview_question_entries/#{the_interview_question_entry.id}", { :notice => "Interview question entry updated successfully."} )
    else
      redirect_to("/interview_question_entries/#{the_interview_question_entry.id}", { :alert => the_interview_question_entry.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interview_question_entry = InterviewQuestionEntry.where({ :id => the_id }).at(0)

    the_interview_question_entry.destroy

    redirect_to("/interview_question_entries", { :notice => "Interview question entry deleted successfully."} )
  end
end
