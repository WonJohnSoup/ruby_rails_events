class Event < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :users_joined, through: :joins, source: :join
  has_many :comments, dependent: :destroy
  validates :name, :timing, :location, :state, presence: true
end
