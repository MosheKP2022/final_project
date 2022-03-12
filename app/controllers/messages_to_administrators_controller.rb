class MessagesToAdministratorsController < ApplicationController
  def index
    matching_messages_to_administrators = MessagesToAdministrator.all

    @list_of_messages_to_administrators = matching_messages_to_administrators.order({ :created_at => :desc })

    render({ :template => "messages_to_administrators/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_messages_to_administrators = MessagesToAdministrator.where({ :id => the_id })

    @the_messages_to_administrator = matching_messages_to_administrators.at(0)

    render({ :template => "messages_to_administrators/show.html.erb" })
  end

  def create
    the_messages_to_administrator = MessagesToAdministrator.new
    the_messages_to_administrator.title = params.fetch("query_title")
    the_messages_to_administrator.body = params.fetch("query_body")
    the_messages_to_administrator.user_id = @current_user.id

    if the_messages_to_administrator.valid?
      the_messages_to_administrator.save
      redirect_to("/messages_to_administrators", { :notice => "Messages to administrator created successfully." })
    else
      redirect_to("/messages_to_administrators", { :alert => the_messages_to_administrator.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_messages_to_administrator = MessagesToAdministrator.where({ :id => the_id }).at(0)

    the_messages_to_administrator.title = params.fetch("query_title")
    the_messages_to_administrator.body = params.fetch("query_body")
    the_messages_to_administrator.user_id = params.fetch("query_user_id")

    if the_messages_to_administrator.valid?
      the_messages_to_administrator.save
      redirect_to("/messages_to_administrators/#{the_messages_to_administrator.id}", { :notice => "Messages to administrator updated successfully."} )
    else
      redirect_to("/messages_to_administrators/#{the_messages_to_administrator.id}", { :alert => the_messages_to_administrator.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_messages_to_administrator = MessagesToAdministrator.where({ :id => the_id }).at(0)

    the_messages_to_administrator.destroy

    redirect_to("/messages_to_administrators", { :notice => "Messages to administrator deleted successfully."} )
  end
end
