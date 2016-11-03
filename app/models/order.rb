class Order < ApplicationRecord
  validates :total, presence: true
  validates :server_id, presence: true
  
  
  belongs_to :server, optional: true, dependent: :destroy
  has_many :order_items
  has_many :items, through: :order_items
end
