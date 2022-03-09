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
end
