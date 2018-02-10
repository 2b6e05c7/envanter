class Group < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  before_destroy :make_free_associated_products

  has_many :membership, dependent: :destroy
  has_many :users, through: :membership
  has_many :debits, dependent: :destroy
  has_many :products, through: :debits

  def make_free_associated_products
    Product.where(id: debits.where(status: :active).ids).update_all(status: :free)
  end
end
