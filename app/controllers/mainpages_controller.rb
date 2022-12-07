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






  def data_filter
    @company=params.fetch("company")
    @position_type=params.fetch("position_type")
    @role=params.fetch("role")
    @round=params.fetch("round")

    if @company=="0"
      @questions_list=InterviewQuestionEntry.all.order({:frequency=>:desc})
      @formats_list=InterviewFormatsEntry.all.order({:frequency=>:desc})
      @comments_list="Must filter by company and position type to see comments."
      @list=CompanyRole.where({:name=>@company})
      @id_list=@list.ids
      if @position_type=="0"
        if @role=="0"
          if @round=="0"
            @questions_list=InterviewQuestionEntry.all.order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.all.order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @questions_list=InterviewQuestionEntry.all.order({:frequency=>:desc})
            @formats_list=@formats_list.where({:round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        else #role is filtered
          if @round=="0"
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:role_id=>@role_id}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:role_id=>@role_id, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        end
      else #position is filtered
        @list=CompanyRole.where({:full_part_time=>@position_type})
        @id_list=@list.ids
        if @role=="0"
          if @round=="0"
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        else #role is filtered
          if @round=="0"
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list, :role_id=>@role_id, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        end
      end
    else #company is filtered
      @list=CompanyRole.where({:name=>@company})
      @id_list=@list.ids
      if @position_type=="0"
        if @role=="0"
          if @round=="0"
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list}).order({:frequency=>:desc})
            @formats_list=@formats_list.where({:company_id=>@id_list, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        else #role is filtered
          if @round=="0"
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@id_list, :role_id=>@role_id, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        end
      else #position is filtered
        @better_list=@list.where({:full_part_time=>@position_type})
        @better_id_list=@better_list.ids
        if @role=="0"
          if @round=="0"
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@better_id_list}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@better_id_list}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@better_id_list}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@better_id_list, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        else #role is filtered
          if @round=="0"
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@better_id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@better_id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          else #round is filtered
            @role_id=Role.where({:role=>@role})
            @questions_list=InterviewQuestionEntry.where({:company_roles_id=>@better_id_list, :role_id=>@role_id}).order({:frequency=>:desc})
            @formats_list=InterviewFormatsEntry.where({:company_id=>@better_id_list, :role_id=>@role_id, :round=>@round}).order({:frequency=>:desc})
            render(:template=>"general/data_filter.html.erb")
          end
        end
      end
    end
















  end
end
