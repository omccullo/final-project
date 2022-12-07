class QuestionsController < ApplicationController
  def index
    matching_questions = Question.all

    @list_of_questions = matching_questions.order({ :created_at => :desc }) 

    render({ :template => "questions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_questions = Question.where({ :id => the_id })

    @the_question = matching_questions.at(0)

    render({ :template => "questions/show.html.erb" })
  end

  def create
    @company_id=params.fetch("company_id")
    @role_id=params.fetch("role_id")
    loop_count=params.fetch("loop_count").to_i
    
    new_loop_count=1

    while new_loop_count<=loop_count
      if params.fetch("new_q_"+new_loop_count.to_s)=="0"
        question = Question.new
        question.text = params.fetch("new_question_"+new_loop_count.to_s)
        question.question_type = params.fetch("new_q_type_"+new_loop_count.to_s)
        question.save
        @q_id=Question.all.order({:created_at=>:desc}).at(0).id
        question_entry= InterviewQuestionEntry.new
        question_entry.question_id=@q_id
        question_entry.company_roles_id=@company_id
        question_entry.role_id=@role_id
        question_entry.frequency=1
        question_entry.save
      else
        @q_id=params.fetch("new_q_"+new_loop_count.to_s)
        question_entry= InterviewQuestionEntry.new
        question_entry.question_id=@q_id
        question_entry.company_roles_id=@company_id
        question_entry.role_id=@role_id
        question_entry.frequency=1
        question_entry.save
      end
      new_loop_count=new_loop_count+1
    end

    redirect_to("/interview_comment")

  end

  def update
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.text = params.fetch("query_text")

    if the_question.valid?
      the_question.save
      redirect_to("/questions/#{the_question.id}", { :notice => "Question updated successfully."} )
    else
      redirect_to("/questions/#{the_question.id}", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.destroy

    redirect_to("/questions", { :notice => "Question deleted successfully."} )
  end 

  def new 
    @num_of_new=params.fetch("new_q_number").to_i
    @company_id=params.fetch("company_id")
    @role_id=params.fetch("role_id")
    @round=params.fetch("round")
    @loop_number=params.fetch("question_number").to_i
    @loop_count=1
    while @loop_count<=@loop_number
      @num_of_new=params.fetch("new_q_number").to_i
      @company_id=params.fetch("company_id")
      @role_id=params.fetch("role_id")
      @round=params.fetch("round")
      if params["question"+@loop_count.to_s].to_i>0
        question_id=params.fetch("question"+@loop_count.to_s)
        interview_question_entry = InterviewQuestionEntry.where({:question_id=>question_id, :company_roles_id=>@company_id, :role_id=>@role_id}).at(0)
        new_frequency=interview_question_entry.frequency
        new_frequency=new_frequency+1
        interview_question_entry.frequency=new_frequency
        interview_question_entry.save
      end 
      @loop_count=@loop_count+1
      
    end
    if @num_of_new>0
      render({ :template => "questions/new.html.erb" })
    else 
      redirect_to("/interview_comment")
    end
  end
end 
