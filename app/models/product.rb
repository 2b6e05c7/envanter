class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  belongs_to :template
  has_many :debits
  has_many :users, through: :debits
  has_many :groups, through: :debits

  enum status: {
    free: 0,
    busy: 1,
    out_of_use: 2
  }

  def any_pending_debit?
    debits.exists?(status: :pending)
  end

  def can_debit?
    free?
  end

  def destroyable?
    debits.none?
  end
end
