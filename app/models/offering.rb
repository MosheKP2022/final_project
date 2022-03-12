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

  belongs_to(:giver, { :required => true, :class_name => "User", :foreign_key => "giver_id", :counter_cache => true })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "offering_id", :dependent => :nullify })
  has_many(:labeled_offerings, { :class_name => "LabeledOffering", :foreign_key => "offering_id" })
  has_many(:tags, { :through => :labeled_offerings, :source => :tag })

  validates(:title, { :presence => true })
  validates(:title, { :uniqueness => { :scope => ["giver_id"], :message => "You've already used this title" } })
  validates(:price, { :numericality => { :greater_than_or_equal_to => 0 } })
  validates(:price, { :presence => true })
  validates(:min_age, { :numericality => { :greater_than_or_equal_to => 0 } })
  validates(:min_age, { :presence => true })
  validates(:max_age, { :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99 } })
  validates(:max_age, { :presence => true })
  validates(:giver_id, { :numericality => true })
  validates(:giver_id, { :presence => true })
  validates(:description, { :presence => true })
  validates(:address, { :presence => true })
  





end
