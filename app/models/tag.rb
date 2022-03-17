# == Schema Information
#
# Table name: tags
#
#  id                      :integer          not null, primary key
#  category                :string
#  labeled_offerings_count :integer
#  sub_category            :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Tag < ApplicationRecord

  has_many(:labeled_offerings, { :class_name => "LabeledOffering", :foreign_key => "tag_id" })
  has_many(:offerings, { :through => :labeled_offerings, :source => :offering })

  validates(:sub_category, { :presence => true })
  validates(:category, { :presence => true })
end
