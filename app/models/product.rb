class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  belongs_to :template
  has_many :debits
  has_many :users, through: :debits
  has_many :groups, through: :debits
  enum status: [ :free, :busy, :out_of_use ]
end
