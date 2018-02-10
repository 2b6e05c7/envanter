class Template < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, :properties, presence: true

  def destroyable?
    products.none?
  end
end
