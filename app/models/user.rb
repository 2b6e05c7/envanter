class User < ApplicationRecord
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  )

  has_many :membership, dependent: :destroy
  has_many :groups, through: :membership
  has_many :debits, dependent: :destroy
  has_many :products, through: :debits

  enum role: {
    admin: 0,
    staff: 1,
    responsible: 2,
    manager: 3
  }

  enum locale: {
    en: 0,
    tr: 1
  }

  def full_name
    first_name + ' ' + last_name
  end
end
