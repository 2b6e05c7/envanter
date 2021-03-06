class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  mount_uploader :bill, BillUploader

  belongs_to :template
  has_many :debits, dependent: :destroy
  has_many :users, through: :debits
  has_many :groups, through: :debits

  validates(
    :name,
    :template_id,
    :company,
    :properties,
    :year,
    :warranty,
    :warranty_end,
    :end_of_lifetime,
    presence: true
  )

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

  def destroyable?
    debits.none?
  end
end
