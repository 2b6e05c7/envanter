class Group < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
  has_many :membership
  has_many :users, through: :membership
  has_many :debits
  has_many :products, through: :debits

  def destroy
    return false if users.any? || debits.any?
    super
  end
end
