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

  has_many(:offerings, { :class_name => "Offering", :foreign_key => "giver_id", :dependent => :nullify })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id" })
  has_many(:messages_to_administrators, { :class_name => "MessagesToAdministrator", :foreign_key => "user_id" })

  validates(:private, { :presence => true })
  # validates(:phone, { :numericality => true })
  # validates(:phone, { :uniqueness => { :allow_blank => true } })
  validates(:last_name, { :presence => true })
  # validates(:kids6_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  # validates(:kids5_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  # validates(:kids4_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  # validates(:kids3_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  # validates(:kids2_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  # validates(:kids2_age, { :uniqueness => { :allow_blank => true } })
  # validates(:kids3_age, { :uniqueness => { :allow_blank => true } })
  # validates(:kids4_age, { :uniqueness => { :allow_blank => true } })
  # validates(:kids5_age, { :uniqueness => { :allow_blank => true } })
  # validates(:kids6_age, { :uniqueness => { :allow_blank => true } })
  validates(:kids1_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  validates(:kids1_age, { :presence => true })
  validates(:first_name, { :presence => true })
  validates(:first_name, { :uniqueness => { :scope => ["email"] } })
  validates(:last_name, { :uniqueness => { :scope => ["email"] } })
end
