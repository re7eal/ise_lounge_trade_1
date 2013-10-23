class Trade < ActiveRecord::Base
  has_many :have_courses, dependent: :destroy
  has_many :want_courses, dependent: :destroy
  has_many :trade_messages, dependent: :destroy
  belongs_to :user
end
