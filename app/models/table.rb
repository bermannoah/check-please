class Table < ActiveRecord::Base
  validates :location, presence: true, uniqueness: true

  belongs_to :server, optional: true
  has_many :table_items
  has_many :items, through: :table_items
end
