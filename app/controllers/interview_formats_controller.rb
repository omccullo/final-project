class InterviewFormatsController < ApplicationController
  def index
    matching_interview_formats = InterviewFormat.all

    @list_of_interview_formats = matching_interview_formats.order({ :created_at => :desc })

    render({ :template => "interview_formats/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interview_formats = InterviewFormat.where({ :id => the_id })

    @the_interview_format = matching_interview_formats.at(0)

    render({ :template => "interview_formats/show.html.erb" })
  end

  def create
    the_interview_format = InterviewFormat.new
    the_interview_format.number_of_interviews = params.fetch("query_number_of_interviews")
    the_interview_format.duration = params.fetch("query_duration")
    the_interview_format.behavioral = params.fetch("query_behavioral")
    the_interview_format.case = params.fetch("query_case")

    if the_interview_format.valid?
      the_interview_format.save
      redirect_to("/interview_formats", { :notice => "Interview format created successfully." })
    else
      redirect_to("/interview_formats", { :alert => the_interview_format.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interview_format = InterviewFormat.where({ :id => the_id }).at(0)

    the_interview_format.number_of_interviews = params.fetch("query_number_of_interviews")
    the_interview_format.duration = params.fetch("query_duration")
    the_interview_format.behavioral = params.fetch("query_behavioral")
    the_interview_format.case = params.fetch("query_case")

    if the_interview_format.valid?
      the_interview_format.save
      redirect_to("/interview_formats/#{the_interview_format.id}", { :notice => "Interview format updated successfully."} )
    else
      redirect_to("/interview_formats/#{the_interview_format.id}", { :alert => the_interview_format.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interview_format = InterviewFormat.where({ :id => the_id }).at(0)

    the_interview_format.destroy

    redirect_to("/interview_formats", { :notice => "Interview format deleted successfully."} )
  end
end
