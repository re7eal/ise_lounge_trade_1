class Trade < ActiveRecord::Base
  has_many :haves
  has_many :wants
  has_many :trade_messages
  belongs_to :user
end
