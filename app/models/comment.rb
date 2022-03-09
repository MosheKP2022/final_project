# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  private      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  offering_id  :integer
#
class Comment < ApplicationRecord
end
