# == Schema Information
#
# Table name: messages_to_administrators
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class MessagesToAdministrator < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  validates(:user_id, { :numericality => true })
  validates(:user_id, { :presence => true })
  validates(:title, { :presence => true })
  validates(:body, { :presence => true })
end
