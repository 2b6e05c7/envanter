class Product < ApplicationRecord
  belongs_to :template
  has_many :debits
  has_many :users, through: :debits
  has_many :groups, through: :debits
  enum status: %i[free busy out_of_use]
end
