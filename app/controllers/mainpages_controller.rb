class MainpagesController < ApplicationController

  def homepage
    render(:template=>"general/homepage.html.erb")
  end

  def new_entry_general
    render(:template=>"general/new_entry_general.html.erb")
  end

  def new_entry_questions
    render(:template=>"general/new_entry_questions.html.erb")
  end

  def new_entry_format
    render(:template=>"general/new_entry_format.html.erb")
  end
end
