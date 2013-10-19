class Trade < ActiveRecord::Base
  has_many :have_courses
  has_many :want_courses
  has_many :trade_messages
  belongs_to :user
end
