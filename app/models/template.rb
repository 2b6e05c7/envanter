class Template < ApplicationRecord
  has_many :products

  validates :name, :properties, presence: true

  def destroyable?
    products.none?
  end
end
