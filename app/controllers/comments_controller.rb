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
    the_comment = Comment.new
    the_comment.commenter_id = @current_user.id
    the_comment.offering_id = params.fetch("query_offering_id")
    the_comment.body = params.fetch("query_body")
    the_comment.private = params.fetch("query_private", false)

    if the_comment.valid?
      the_comment.save
      #redirect_to("/photos/#{comment.photo_id}")
      redirect_to("/offerings/" + the_comment.offering_id.to_s, { :notice => "Comment created successfully." })
    else
      redirect_to("/offerings/" + the_comment.offering_id.to_s, { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.commenter_id = params.fetch("query_commenter_id")
    the_comment.offering_id = params.fetch("query_offering_id")
    the_comment.body = params.fetch("query_body")
    the_comment.private = params.fetch("query_private", false)

    if the_comment.valid?
      the_comment.save
      redirect_to("/offerings/#{the_comment.offering_id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/offerings/#{the_comment.offering_id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/offerings", { :notice => "Comment deleted successfully."} )
  end
end
