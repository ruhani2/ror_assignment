class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :secret_code
  accepts_nested_attributes_for :secret_code

  validates :secret_code, presence: true, on: :create, if: -> { !self.email.eql?('admin@example.com')}
end
