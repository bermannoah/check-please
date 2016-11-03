class Server < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :tables
  has_many :orders 
end
