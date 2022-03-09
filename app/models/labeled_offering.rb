# == Schema Information
#
# Table name: labeled_offerings
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  offering_id :integer
#  tag_id      :integer
#
class LabeledOffering < ApplicationRecord

  belongs_to(:offering, { :required => true, :class_name => "Offering", :foreign_key => "offering_id", :counter_cache => true })
  belongs_to(:tag, { :required => true, :class_name => "Tag", :foreign_key => "tag_id", :counter_cache => true })

  validates(:tag_id, { :presence => true })
  validates(:offering_id, { :presence => true })
  
end
