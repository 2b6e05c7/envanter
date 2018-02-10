class Template < ApplicationRecord
  has_many :products

  def destroyable?
    products.none?
  end
end
