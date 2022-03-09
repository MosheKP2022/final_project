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
end
