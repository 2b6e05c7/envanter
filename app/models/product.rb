class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  mount_uploader :bill, BillUploader

  belongs_to :template
  has_many :debits
  has_many :users, through: :debits
  has_many :groups, through: :debits

  enum status: {
    free: 0,
    busy: 1,
    out_of_use: 2,
    ejected: 3,
    effaced: 4
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
