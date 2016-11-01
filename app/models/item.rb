class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  belongs_to :category, optional: true
  has_many :table_items
  has_many :tables, through: :table_items
end
