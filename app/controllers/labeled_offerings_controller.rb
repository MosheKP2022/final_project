class LabeledOfferingsController < ApplicationController
  def index
    matching_labeled_offerings = LabeledOffering.all

    @list_of_labeled_offerings = matching_labeled_offerings.order({ :created_at => :desc })

    render({ :template => "labeled_offerings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_labeled_offerings = LabeledOffering.where({ :id => the_id })

    @the_labeled_offering = matching_labeled_offerings.at(0)

    render({ :template => "labeled_offerings/show.html.erb" })
  end

  def create
    the_labeled_offering = LabeledOffering.new
    the_labeled_offering.offering_id = params.fetch("query_offering_id")
    the_labeled_offering.tag_id = params.fetch("query_tag_id")

    if the_labeled_offering.valid?
      the_labeled_offering.save
      redirect_to("/labeled_offerings", { :notice => "Labeled offering created successfully." })
    else
      redirect_to("/labeled_offerings", { :alert => the_labeled_offering.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_labeled_offering = LabeledOffering.where({ :id => the_id }).at(0)

    the_labeled_offering.offering_id = params.fetch("query_offering_id")
    the_labeled_offering.tag_id = params.fetch("query_tag_id")

    if the_labeled_offering.valid?
      the_labeled_offering.save
      redirect_to("/labeled_offerings/#{the_labeled_offering.id}", { :notice => "Labeled offering updated successfully."} )
    else
      redirect_to("/labeled_offerings/#{the_labeled_offering.id}", { :alert => the_labeled_offering.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_labeled_offering = LabeledOffering.where({ :id => the_id }).at(0)

    the_labeled_offering.destroy

    redirect_to("/labeled_offerings", { :notice => "Labeled offering deleted successfully."} )
  end
end
