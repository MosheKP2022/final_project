class OfferingsController < ApplicationController
  def index
    matching_offerings = Offering.all

    @list_of_offerings = matching_offerings.order({ :created_at => :desc })

    render({ :template => "offerings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_offerings = Offering.where({ :id => the_id })

    @the_offering = matching_offerings.at(0)

    render({ :template => "offerings/show.html.erb" })
  end

  def create
    the_offering = Offering.new
    the_offering.title = params.fetch("query_title")
    the_offering.min_age = params.fetch("query_min_age")
    the_offering.description = params.fetch("query_description")
    the_offering.giver_id = session.fetch(:user_id)
    the_offering.image = params.fetch("query_image")
    the_offering.address = params.fetch("query_address")
    the_offering.max_age = params.fetch("query_max_age")
    the_offering.price = params.fetch("query_price")
    the_offering.date = params.fetch("query_date")
    the_offering.time = params.fetch("query_time")

    if the_offering.valid?
      the_offering.save
      redirect_to("/offerings", { :notice => "Offering created successfully." })
    else
      redirect_to("/offerings", { :alert => the_offering.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_offering = Offering.where({ :id => the_id }).at(0)

    the_offering.title = params.fetch("query_title")
    the_offering.min_age = params.fetch("query_min_age")
    the_offering.description = params.fetch("query_description")
    the_offering.image = params.fetch("query_image")
    the_offering.address = params.fetch("query_address")
    the_offering.video = params.fetch("query_video")
    the_offering.giver_id = params.fetch("query_giver_id")
    the_offering.max_age = params.fetch("query_max_age")
    the_offering.price = params.fetch("query_price")
    the_offering.date = params.fetch("query_date")
    the_offering.time = params.fetch("query_time")
    the_offering.comments_count = params.fetch("query_comments_count")
    the_offering.labeled_offerings_count = params.fetch("query_labeled_offerings_count")

    if the_offering.valid?
      the_offering.save
      redirect_to("/offerings/#{the_offering.id}", { :notice => "Offering updated successfully."} )
    else
      redirect_to("/offerings/#{the_offering.id}", { :alert => the_offering.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_offering = Offering.where({ :id => the_id }).at(0)

    the_offering.destroy

    redirect_to("/offerings", { :notice => "Offering deleted successfully."} )
  end
end
