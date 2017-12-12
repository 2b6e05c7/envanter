class Group < ApplicationRecord
  has_many :membership
  has_many :users, through: :membership
  has_many :debits
  has_many :products, through: :debits
end
