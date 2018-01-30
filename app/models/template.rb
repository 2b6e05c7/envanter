class Template < ApplicationRecord
  has_many :products

  def destroy
    return false if products.any?
    super
  end
end
