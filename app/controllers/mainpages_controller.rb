class MainpagesController < ApplicationController

  def homepage
    render(:template=>"general/homepage.html.erb")
  end

  def new_entry_general
    render(:template=>"general/new_entry_general.html.erb")
  end

  def new_entry_questions
    @company_id=InterviewFormatsEntry.all.order({:updated_at=>:desc}).at(0).company_id # I know this technically bring up someone filling out the form at the same time but I'm not sure of a better way to carry the variable through. 
    @role_id=InterviewFormatsEntry.all.order({:updated_at=>:desc}).at(0).role_id
    render(:template=>"general/new_entry_questions.html.erb")
  end

  def new_entry_format
    render(:template=>"general/new_entry_format.html.erb")
  end
end
