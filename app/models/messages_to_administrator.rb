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
end
