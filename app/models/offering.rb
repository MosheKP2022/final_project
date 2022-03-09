# == Schema Information
#
# Table name: offerings
#
#  id                      :integer          not null, primary key
#  address                 :string
#  comments_count          :integer
#  date                    :date
#  description             :text
#  image                   :string
#  labeled_offerings_count :integer
#  max_age                 :float
#  min_age                 :float
#  price                   :float
#  time                    :time
#  title                   :string
#  video                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  giver_id                :integer
#
class Offering < ApplicationRecord
end
