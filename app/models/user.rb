# == Schema Information
#
# Table name: users
#
#  id                               :integer          not null, primary key
#  about_me                         :text
#  address                          :string
#  comments_count                   :integer
#  email                            :string
#  first_name                       :string
#  kids1_age                        :float
#  kids2_age                        :float
#  kids3_age                        :float
#  kids4_age                        :float
#  kids5_age                        :float
#  kids6_age                        :float
#  last_name                        :string
#  messages_to_administrators_count :integer
#  offerings_count                  :integer
#  password_digest                  :string
#  phone                            :integer
#  private                          :boolean
#  profile_picture                  :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
