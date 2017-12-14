class Debit < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  belongs_to :product
end
