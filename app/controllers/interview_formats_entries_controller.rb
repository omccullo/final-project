class InterviewFormatsEntriesController < ApplicationController
  def index
    matching_interview_formats_entries = InterviewFormatsEntry.all

    @list_of_interview_formats_entries = matching_interview_formats_entries.order({ :created_at => :desc })

    render({ :template => "interview_formats_entries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interview_formats_entries = InterviewFormatsEntry.where({ :id => the_id })

    @the_interview_formats_entry = matching_interview_formats_entries.at(0)

    render({ :template => "interview_formats_entries/show.html.erb" })
  end

  def create
    the_interview_formats_entry = InterviewFormatsEntry.new
    the_interview_formats_entry.company_id = params.fetch("query_company_id")
    the_interview_formats_entry.format_id = params.fetch("query_format_id")
    the_interview_formats_entry.round = params.fetch("query_round")

    if the_interview_formats_entry.valid?
      the_interview_formats_entry.save
      redirect_to("/interview_formats_entries", { :notice => "Interview formats entry created successfully." })
    else
      redirect_to("/interview_formats_entries", { :alert => the_interview_formats_entry.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interview_formats_entry = InterviewFormatsEntry.where({ :id => the_id }).at(0)

    the_interview_formats_entry.company_id = params.fetch("query_company_id")
    the_interview_formats_entry.format_id = params.fetch("query_format_id")
    the_interview_formats_entry.round = params.fetch("query_round")

    if the_interview_formats_entry.valid?
      the_interview_formats_entry.save
      redirect_to("/interview_formats_entries/#{the_interview_formats_entry.id}", { :notice => "Interview formats entry updated successfully."} )
    else
      redirect_to("/interview_formats_entries/#{the_interview_formats_entry.id}", { :alert => the_interview_formats_entry.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interview_formats_entry = InterviewFormatsEntry.where({ :id => the_id }).at(0)

    the_interview_formats_entry.destroy

    redirect_to("/interview_formats_entries", { :notice => "Interview formats entry deleted successfully."} )
  end
end
