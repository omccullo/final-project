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
    @num_of_new=params.fetch("interviews_number").to_i
    @company_id=params.fetch("company_id")
    @role_id=params.fetch("role_id")
    @round=params.fetch("round")
    
    if @num_of_new>0
      interviews_number=params.fetch("interviews_number").to_i
      interview_duration=params.fetch("duration")
      if params[:min]=="true"
        interview_time_format="min"
      else
        interview_time_format="hr"
      end
      if params[:general]=="true"
        general="true"
      else
        general="false"
      end
      if params[:behavioral]=="true"
        behavioral="true"
      else
        behavioral="false"
      end
      if params[:case_question]=="true"
        case_question="true"
      else
        case_question="false"
      end

      interview_format_id = InterviewFormat.where({:number_of_interviews=>interviews_number, :duration=>interview_duration, :time_format=>interview_time_format, :general=>general, :behavioral=> behavioral, :case=> case_question}).at(0)
      if interview_format_id ==nil 
        the_interview_format = InterviewFormat.new
        the_interview_format.number_of_interviews = interviews_number
        the_interview_format.duration = interview_duration
        the_interview_format.behavioral = behavioral
        the_interview_format.case = case_question
        the_interview_format.general = general
        the_interview_format.time_format = interview_time_format
        the_interview_format.save
      end

      interview_format_id = InterviewFormat.all.order({:created_at=>:desc}).at(0).id
      the_interview_formats_entry = InterviewFormatsEntry.new
      the_interview_formats_entry.company_id = @company_id
      the_interview_formats_entry.round = @round
      the_interview_formats_entry.role_id = @role_id
      the_interview_formats_entry.frequency = 1
      the_interview_formats_entry.format_id=interview_format_id
      the_interview_formats_entry.save
      redirect_to("/questions_asked")

    else # this works thank god. 
      loop_number=params.fetch("format_number").to_i
      loop_count=1
      while loop_count<=loop_number
        if params["format"+loop_count.to_s].to_i>0
          format_id=params.fetch("format"+loop_count.to_s)
          interview_format_entry = InterviewFormatsEntry.where({:company_id=>@company_id, :format_id=>format_id, :round=>@round}).at(0)
          new_frequency=interview_format_entry.frequency
          new_frequency=new_frequency+1
          interview_format_entry.frequency=new_frequency
          interview_format_entry.save
        end 
        loop_count=loop_count+1
      end
      redirect_to("/questions_asked")
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
