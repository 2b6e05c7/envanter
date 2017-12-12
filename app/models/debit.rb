class Debit < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :product
end
