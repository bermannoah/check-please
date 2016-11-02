class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  belongs_to :category, optional: true, dependent: :destroy
  has_many :ticket_items
  has_many :tickets, through: :ticket_items
end
