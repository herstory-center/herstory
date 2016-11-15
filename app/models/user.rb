class User < ApplicationRecord
  has_secure_password
  has_many :categories
  has_many :articles
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
