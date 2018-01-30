class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
  belongs_to :template
  has_many :debits
  has_many :users, through: :debits
  has_many :groups, through: :debits
  enum status: %i[free busy out_of_use]

  def any_pending_debit?
    debits.where(status: :pending).exists?
  end

  def destroy
    return false if debits.any?
    super
  end
end
