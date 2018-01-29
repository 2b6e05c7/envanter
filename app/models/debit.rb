class Debit < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  belongs_to :product
  enum status: %i[pending active inactive]
end
