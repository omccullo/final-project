class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all 

    @list_of_comments = matching_comments.order({ :created_at => :desc })

    render({ :template => "comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    @company_id=params.fetch("company_id")
    @role_id=params.fetch("role_id")
    if params.fetch("new_comment")==""
      redirect_to("/")
    else
      the_comment = Comment.new
      the_comment.company_roles_id = @company_id
      the_comment.comment = params.fetch("new_comment")
      the_comment.role = @role_id
      the_comment.save
      redirect_to("/")
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.user_id = params.fetch("query_user_id")
    the_comment.company_roles_id = params.fetch("query_company_roles_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/#{the_comment.id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/#{the_comment.id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully."} )
  end

  def new
    @company_id=InterviewQuestionEntry.all.order({:updated_at=>:desc}).at(0).company_roles_id # I know this technically bring up someone filling out the form at the same time but I'm not sure of a better way to carry the variable through. 
    @role_id=InterviewQuestionEntry.all.order({:updated_at=>:desc}).at(0).role_id
      render({ :template => "comments/new.html.erb" })
  end
end
