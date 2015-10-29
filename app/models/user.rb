class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  # has_many :events_joined, through: :joins, source: :join
  has_many :comments, dependent: :destroy
  validates :first_name, :last_name, :email, presence: true
  validates :password, :password_confirmation, length: { in: 6..20 }
end
