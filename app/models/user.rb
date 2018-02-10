class User < ApplicationRecord
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  )

  has_many :membership
  has_many :groups, through: :membership
  has_many :debits
  has_many :products, through: :debits

  enum role: {
    admin: 0,
    coordinator: 1,
    staff: 2
  }

  enum locale: {
    en: 0,
    tr: 1
  }

  def full_name
    first_name + ' ' + last_name
  end
end
