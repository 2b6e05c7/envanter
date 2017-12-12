class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :membership
  has_many :groups, through: :membership
  has_many :debits
  has_many :products, through: :debits
  enum role: [ :staff, :admin ]
  enum locale: [ :en, :tr ]
end
