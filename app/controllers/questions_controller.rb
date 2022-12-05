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
    loop_count=params.fetch("loop_count").to_i
    
    new_loop_count=1

    while new_loop_count<=loop_count  
      question = Question.new
      question.text = params.fetch("new_question_"+new_loop_count.to_s)
      question.question_type = params.fetch("new_q_type_"+new_loop_count.to_s)
      question.save
      new_loop_count=new_loop_count+1
      
    end

    redirect_to("/comments", { :notice => "Question(s) created successfully." })


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
    if @num_of_new>0
      matching_questions = Question.all

      @list_of_questions = matching_questions.order({ :created_at => :desc }) 

      render({ :template => "questions/new.html.erb" })
    else
      redirect_to("/interview_comment")
    end
  end
end
